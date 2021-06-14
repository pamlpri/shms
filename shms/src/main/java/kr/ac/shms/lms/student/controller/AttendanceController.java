package kr.ac.shms.lms.student.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
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
import org.springframework.web.bind.annotation.RequestMethod;
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
import kr.ac.shms.subject.service.SubjectService;

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
	private StudentService studentService;
	
	@Inject
	private LectureService lectureService;
	
	@RequestMapping("/qrGen.do")
	public String selectQRInfo(
			@AuthenticationPrincipal(expression="realUser") UserLoginVO user
			, @RequestParam("lec_code") String lec_code
			, @RequestParam("lec_name") String lec_name
			, HttpSession session
			, Model model
			) {
		AttendVO qrInfoVO = new AttendVO();
		qrInfoVO.setLec_code(lec_code);
		qrInfoVO.setStdnt_no(user.getUser_id());
		studentService.selectQRInfo(qrInfoVO);
		model.addAttribute("qrInfo", qrInfoVO);
		model.addAttribute("lec_name", lec_name);
		return "lecture/qrgenerator";
	}
	
	@RequestMapping(value="/qrScanner.do", produces=MediaType.APPLICATION_JSON_UTF8_VALUE, method=RequestMethod.POST)
	@ResponseBody
	public Map<String, String> insertAttendance(
			@RequestParam("qrcodedata") String qrcodeData
			, Model model
			) {
		String[] arr = qrcodeData.split(",");
		String stdnt_no = arr[0];
		String lec_code = arr[1];
		
		logger.info("qrcodeData : {}", qrcodeData);
		AttendVO attendVO = new AttendVO();
		attendVO.setStdnt_no(stdnt_no);
		attendVO.setLec_code(lec_code);
		
		ServiceResult attendResult = studentService.selectCountAttend(attendVO);
		ServiceResult exitResult = studentService.selectCountExit(attendVO);

		AttendVO attendInfo = new AttendVO();
		attendInfo.setStdnt_no(stdnt_no);
		attendInfo.setLec_code(lec_code);

		LectureVO lecture = lectureService.selectLectureDetails(lec_code);
		logger.info("lecture {}", lecture);

		Map<String, String> resp = new HashMap<>();
		ServiceResult result = ServiceResult.FAIL;
		
		if(ServiceResult.FAIL.equals(attendResult)) {
			result = studentService.attend(attendInfo);
			if(ServiceResult.OK.equals(result)) {
				AttendVO getAttendInfo = new AttendVO();
				studentService.selectAtndanTime(getAttendInfo);
				model.addAttribute("attendInfo", attendInfo);
				model.addAttribute("attend_time", getAttendInfo.getAttend_time());
				model.addAttribute("lecture", lecture);
				resp.put("resp", "OK");
				
			}else {
				resp.put("resp", "FAIL");
			}
		}else if(ServiceResult.OK.equals(attendResult) && ServiceResult.FAIL.equals(exitResult)){
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
				resp.put("resp", "OK");
			}else {
				resp.put("resp", "FAIL");
			}
		}
		return resp;
	}
	@RequestMapping(value="/qrTimeout.do", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public String qrTimeoutForAjax(
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
		
		ServiceResult attendResult = studentService.selectCountAttend(atVo);
		ServiceResult exitResult = studentService.selectCountExit(atVo);
		
		AttendVO attend = new AttendVO();
		attend.setStdnt_no(stdnt_no);
		attend.setLec_code(lec_code);
        String attendTime = studentService.selectAtndanTime(attend).getAttend_time();
        String exitTime = studentService.selectAtndanTime(attend).getExit_time();
		
		
		if(ServiceResult.OK.equals(attendResult)&& ServiceResult.FAIL.equals(exitResult)) {
			resultMap.put("result", "exitFAIL");
		}else if(ServiceResult.FAIL.equals(attendResult) && ServiceResult.FAIL.equals(exitResult)){	// 출석 기록이나 퇴실기록이 없을 때
			resultMap.put("result", "FAIL");
			resultMap.put("lec_code", lec_code);
		}else if(ServiceResult.OK.equals(attendResult) && ServiceResult.OK.equals(exitResult)) {	// 퇴실기록이 있을 때 
			resultMap.put("result", "OK");
			resultMap.put("attendTime", attendTime);
			resultMap.put("exitTime", exitTime);
			System.out.println("exitTime : " + exitTime);
		}else if(ServiceResult.OK.equals(attendResult) ) {	// 이미 출석한 기록이 있을 때
			resultMap.put("result", "attendOK");
			resultMap.put("lec_code", lec_code);
			resultMap.put("attendTime", attendTime);
			
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