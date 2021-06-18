package kr.ac.shms.lecture.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.MediaType;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ac.shms.common.enumpkg.ServiceResult;
import kr.ac.shms.lecture.service.LectureStudentService;
import kr.ac.shms.lms.login.vo.UserLoginVO;
import kr.ac.shms.lms.student.service.StudentService;
import kr.ac.shms.lms.student.vo.AttendVO;

/**
 * @author 김보미
 * @since 2021. 5. 31.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일        수정자      수정내용
 * --------     --------    ----------------------
 * 2021. 5. 31.  김보미      최초작성
 * 2021. 6.  1.  김보미		 출석(퇴실)
 * 2021. 6. 10.  김보미		 출석상태 업데이트
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Controller
@RequestMapping("/lecture")
public class AttendanceController {
	private static final Logger logger = LoggerFactory.getLogger(AttendanceController.class);
	
	@Inject
	private LectureStudentService lectureStudentService;
	
	private boolean qrCheck = false;
	@RequestMapping("/qrGen.do")
	public String selectQRInfo(
			@AuthenticationPrincipal(expression="realUser") UserLoginVO user
			, @RequestParam("lec_code") String lec_code
			, @RequestParam("lec_name") String lec_name
			, Model model
			) {
		AttendVO qrInfoVO = new AttendVO();
		qrInfoVO.setLec_code(lec_code);
		qrInfoVO.setStdnt_no(user.getUser_id());
		lectureStudentService.selectQRInfo(qrInfoVO);
		model.addAttribute("qrInfo", qrInfoVO);
		model.addAttribute("lec_name", lec_name);
		qrCheck = false;
		return "lecture/qrgenerator";
	}
	
	@RequestMapping(value="/qrScanner.do", produces=MediaType.APPLICATION_JSON_UTF8_VALUE, method=RequestMethod.POST)
	@ResponseBody
	public Map<String, String> insertAttendance(
			@RequestParam("qrcodedata") String qrcodeData
			, Model model
			) {
		String[] arr = qrcodeData.split(",");
		logger.info("arr : {} : {}", arr.length, arr);
		String stdnt_no = arr[0];
		String lec_code = arr[1];
		
		AttendVO attendVO = new AttendVO();
		attendVO.setStdnt_no(stdnt_no);
		attendVO.setLec_code(lec_code);
		
		ServiceResult attendResult = lectureStudentService.selectCountAttend(attendVO);
		ServiceResult exitResult = lectureStudentService.selectCountExit(attendVO);

		Map<String, String> resp = new HashMap<>();
		ServiceResult result = ServiceResult.FAIL;
		if(ServiceResult.FAIL.equals(attendResult)) { // 입실 저장
			result = lectureStudentService.attend(attendVO);
			if(ServiceResult.OK.equals(result)) {
				resp.put("resp", "OK");
			}else {
				resp.put("resp", "FAIL");
			}
		} else if(ServiceResult.OK.equals(attendResult) && ServiceResult.FAIL.equals(exitResult)){ // 
			result = lectureStudentService.exit(attendVO);
			if(ServiceResult.OK.equals(result)) {
				AttendVO vo = lectureStudentService.selectAtndanTime(attendVO);
				logger.info("vo : {}", vo);
				resp.put("attend_time", vo.getAttend_time());
				resp.put("exit_time", vo.getExit_time());
				resp.put("lec_code", lec_code);
				resp.put("respExit", "OK");
			}else {
				resp.put("respExit", "FAIL");
			}
		}
		qrCheck = true;
		return resp;
	}
	@RequestMapping(value="/qrCheck.do", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public Map<String, Object> qrCheckAjax() {
		Map<String, Object> map = new HashMap<>();
		map.put("qrCheck", qrCheck);
		return map;
	}
	
	@RequestMapping(value="/qrTimeout.do", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public Map<String, Object> qrTimeoutForAjax(
			@AuthenticationPrincipal(expression="realUser") UserLoginVO user
			, @RequestBody Map<String, String> atndan
			, HttpServletResponse resp
			) throws IOException {
		Map<String, Object> resultMap = new HashMap<>();
		String stdnt_no = user.getUser_id();
		String lec_code = atndan.get("lec_code");
		
		AttendVO atVo = new AttendVO();
		atVo.setStdnt_no(stdnt_no);
		atVo.setLec_code(lec_code);
		
		ServiceResult attendResult = lectureStudentService.selectCountAttend(atVo); 
		ServiceResult exitResult = lectureStudentService.selectCountExit(atVo); 
		
        if(ServiceResult.FAIL.equals(attendResult) && ServiceResult.FAIL.equals(exitResult)) { // 입실/퇴실 데이터가 없는 경우
        	resultMap.put("result", "FAIL");
        } else if(ServiceResult.OK.equals(attendResult) && ServiceResult.FAIL.equals(exitResult)) { // 입실은 있고 퇴실이 없음
        	String attendTime = lectureStudentService.selectAtndanTime(atVo).getAttend_time();
        	resultMap.put("attendTime", attendTime);
        	resultMap.put("result", "exitFAIL");
        } else if(ServiceResult.OK.equals(attendResult) && ServiceResult.OK.equals(exitResult)) { // 입실/퇴실 데이터가 있는 경우
        	String attendTime = lectureStudentService.selectAtndanTime(atVo).getAttend_time();
        	String exitTime = lectureStudentService.selectAtndanTime(atVo).getExit_time();
        	resultMap.put("attendTime", attendTime);
        	resultMap.put("exitTime", exitTime);
        	resultMap.put("result", "OK");
        }
		return resultMap;
	}
	
	@RequestMapping(value="/attendanceResult.do", method=RequestMethod.POST)
	public String attendanceReulst(
		@RequestParam("attend_time") String attend_time
		, @RequestParam("exit_time") String exit_time
		, @RequestParam("lec_name") String lec_name
		, Model model
		) {
		String view = null;
		if((attend_time != null || !attend_time.isEmpty()) && (exit_time == null || exit_time.isEmpty())) {
			model.addAttribute("attend_time", attend_time);
			model.addAttribute("lec_name", lec_name);
			view = "lecture/qrResult";
		}else if((attend_time != null || !attend_time.isEmpty()) && (exit_time != null || !exit_time.isEmpty())) {
			model.addAttribute("exit_time", exit_time);
			model.addAttribute("lec_name", lec_name);
			view = "lecture/qrResult";
		}
		return view;
	}
	
	@RequestMapping(value="/updateAttendanceStat.do", method=RequestMethod.POST, produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public Map<String, Object> attendanceStatUpdate(
		@AuthenticationPrincipal(expression="realUser") UserLoginVO user
		, @RequestParam("lec_code") String lec_code
		, @RequestParam("attend_time") String attend_time
		, @RequestParam("exit_time") String exit_time
		, Model model
		) {
		String stdnt_no = user.getUser_id();
		AttendVO atVo = new AttendVO();
		atVo.setStdnt_no(stdnt_no);
		atVo.setLec_code(lec_code);
		
		ServiceResult attendResult = lectureStudentService.selectCountAttend(atVo);
		ServiceResult exitResult = lectureStudentService.selectCountExit(atVo);
		
		// 출석 상태 update하기
		AttendVO vo = lectureStudentService.selectAttendInfo(atVo);
		Map<String, Object> result = new HashMap<>();
		if(ServiceResult.OK.equals(attendResult) && ServiceResult.OK.equals(exitResult)) {
			ServiceResult updateResult = ServiceResult.FAIL;
			if(ServiceResult.OK.equals(attendResult) && ServiceResult.OK.equals(exitResult)) {
				updateResult = lectureStudentService.updateAttendStat(atVo);
				if(ServiceResult.OK.equals(updateResult)) {
					result.put("result", "OK");
				}
			}
		}
		return result;
	}
}