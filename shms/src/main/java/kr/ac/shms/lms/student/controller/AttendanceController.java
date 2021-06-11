package kr.ac.shms.lms.student.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.MediaType;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;

import kr.ac.shms.common.enumpkg.MimeType;
import kr.ac.shms.common.enumpkg.ServiceResult;
import kr.ac.shms.lecture.service.LectureService;
import kr.ac.shms.lms.login.vo.UserLoginVO;
import kr.ac.shms.lms.student.service.StudentService;
import kr.ac.shms.lms.student.vo.AttendVO;
import kr.ac.shms.lms.student.vo.LectureVO;

/**
 * @author PC-24
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
	private StudentService studentService;
	
	@Inject
	private LectureService lectureService;
	
	@RequestMapping("/qrGen.do")
	public String selectQRInfo(
			@AuthenticationPrincipal(expression="realUser") UserLoginVO user
			, @RequestParam("lec_code") String lec_code
			, HttpSession session
			, Model model
			) {
		AttendVO qrInfoVO = new AttendVO();
		qrInfoVO.setLec_code(lec_code);
		qrInfoVO.setStdnt_no(user.getUser_id());
		studentService.selectQRInfo(qrInfoVO);
		model.addAttribute("qrInfo", qrInfoVO);
		return "lecture/qrgenerator";
	}
	@RequestMapping("/qrScanner.do")
	public String insertAttendance(
			@RequestParam("qrcodedata") String qrcodeData
			, HttpSession session
			, Model model
			) {
		String[] arr = qrcodeData.split(",");
		String stdnt_no = arr[0];
		String lec_code = arr[1];
		
		
		AttendVO attendVO = new AttendVO();
		attendVO.setStdnt_no(stdnt_no);
		attendVO.setLec_code(lec_code);
		
		ServiceResult attendResult = studentService.selectCountAttend(attendVO);

		AttendVO attendInfo = new AttendVO();
		attendInfo.setStdnt_no(stdnt_no);
		attendInfo.setLec_code(lec_code);

		LectureVO lecture = lectureService.selectLectureDetails(lec_code);

		String view = null;
		ServiceResult result = ServiceResult.FAIL;
		
		if(ServiceResult.FAIL.equals(attendResult)) {
			result = studentService.attend(attendInfo);
			if(ServiceResult.OK.equals(result)) {
				AttendVO getAttendInfo = new AttendVO();
				studentService.selectAtndanTime(getAttendInfo);
				model.addAttribute("attendInfo", attendInfo);
				model.addAttribute("attend_time", getAttendInfo.getAttend_time());
				model.addAttribute("lecture", lecture);
				view = "lecture/qrResult";
			}else {
				view = "lecture/main";
			}
		}else {
			result = studentService.exit(attendInfo);
			if(ServiceResult.OK.equals(result)) {
				AttendVO getAttendInfo = new AttendVO();
				getAttendInfo.setStdnt_no(stdnt_no);
				getAttendInfo.setLec_code(lec_code);
				AttendVO vo = studentService.selectAtndanTime(getAttendInfo);
				
				model.addAttribute("attendInfo", attendInfo);
				model.addAttribute("attend_time", vo.getAttend_time());
				model.addAttribute("lec_code", lec_code);
				model.addAttribute("lecture", lecture);
				view = "lecture/qrResult";
			}else {
				view = "lecture/main";
			}
		}
		return view;
	}
	
	@RequestMapping(value="/qrTimeout.do", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public String qrTimeoutForAjax(
			@AuthenticationPrincipal(expression="realUser") UserLoginVO user
			, @RequestBody Map<String, String> atndan
			, HttpServletResponse resp
			) throws IOException {
		logger.info("qrDataMap : {}", atndan);
		Map<String, Object> resultMap = new HashMap<>();
		
		AttendVO atVo = new AttendVO();
		atVo.setStdnt_no(user.getUser_id());
		atVo.setLec_code(atndan.get("lec_code"));
		
		ServiceResult attendResult = studentService.selectCountAttend(atVo);
		ServiceResult exitResult = studentService.selectCountExit(atVo);
		
		if(ServiceResult.OK.equals(attendResult) || ServiceResult.OK.equals(exitResult)) {
			// 출석 상태 update하기
			AttendVO studentInfo = new AttendVO();
			studentInfo.setStdnt_no(user.getUser_id());
			studentInfo.setLec_code(atndan.get("lec_code"));
			
			AttendVO vo = studentService.selectAttendInfo(studentInfo);
			int total_lec_time = vo.getTotal_lec_time();	// 총 강의 시간(분)
			int attend_check = vo.getAttend_check();		// 출석인정시간(분)
			int start_check = vo.getStart_check();			// 강의시작시간-입실시간(분)
			int finish_check = vo.getFinish_check();		// 퇴실시간-강의종료시간(분)
			
			AttendVO attend = new AttendVO();
			attend.setStdnt_no(user.getUser_id());
			attend.setLec_code(atndan.get("lec_code"));
			
			if(ServiceResult.OK.equals(attendResult) && ServiceResult.OK.equals(exitResult)) {
				ServiceResult updateResult = ServiceResult.FAIL;
				if(ServiceResult.OK.equals(attendResult) && ServiceResult.OK.equals(exitResult)) {
					if(attend_check < 15 && attend_check > -15) {
						if(start_check< 15 && start_check > -15 && finish_check < 15 && finish_check > -15) {
							attend.setAttend_stat("CS");
							updateResult = studentService.updateAttendStat(attend);
							if(ServiceResult.OK.equals(updateResult)) {
								resultMap.put("result", ServiceResult.OK);
							}else {
								resultMap.put("result", ServiceResult.FAIL);
							}
						}
					}else {
						if((total_lec_time / 2) < attend_check) {
							attend.setAttend_stat("JG");
							updateResult = studentService.updateAttendStat(attend);
							if(ServiceResult.OK.equals(updateResult)) {
								resultMap.put("result", ServiceResult.OK);							
							}else {
								resultMap.put("result", ServiceResult.FAIL);
							}
						}else if((total_lec_time / 2) > attend_check) {
							attend.setAttend_stat("GS");
							updateResult = studentService.updateAttendStat(attend);
							if(ServiceResult.OK.equals(updateResult)) {
								resultMap.put("result", ServiceResult.OK);							
							}else {
								resultMap.put("result", ServiceResult.FAIL);
							}
						}
					}
				}
			}
			resultMap.put("result", ServiceResult.OK);
		}else if(ServiceResult.FAIL.equals(attendResult) || ServiceResult.FAIL.equals(exitResult)){
			resultMap.put("result", ServiceResult.FAIL);
		}else if(ServiceResult.OK.equals(exitResult)) {

		}
		resp.setContentType(MimeType.JSON.getMime());
		try(
			PrintWriter out = resp.getWriter();	
		){
			ObjectMapper mapper = new ObjectMapper();
			mapper.writeValue(out, resultMap);
		}
		return null;
	}
}