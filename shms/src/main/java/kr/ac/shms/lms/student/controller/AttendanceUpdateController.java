package kr.ac.shms.lms.student.controller;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.MediaType;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ac.shms.common.enumpkg.ServiceResult;
import kr.ac.shms.lms.login.vo.UserLoginVO;
import kr.ac.shms.lms.student.service.StudentService;
import kr.ac.shms.lms.student.vo.AttendVO;

/**
 * @author 김보미
 * @since 2021. 6. 16.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일         수정자       수정내용
 * --------     --------    ----------------------
 * 2021. 6. 16.   김보미       최초작성
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Controller
public class AttendanceUpdateController {
	private static final Logger logger = LoggerFactory.getLogger(AttendanceUpdateController.class);
	@Inject
	private StudentService studentService;
	
	@RequestMapping(value="/lecture/updateAttendanceStat.do", method=RequestMethod.POST, produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
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
		
		ServiceResult attendResult = studentService.selectCountAttend(atVo);
		ServiceResult exitResult = studentService.selectCountExit(atVo);
		
		// 출석 상태 update하기
		AttendVO vo = studentService.selectAttendInfo(atVo);
		Map<String, Object> result = new HashMap<>();
		if(ServiceResult.OK.equals(attendResult) && ServiceResult.OK.equals(exitResult)) {
			ServiceResult updateResult = ServiceResult.FAIL;
			if(ServiceResult.OK.equals(attendResult) && ServiceResult.OK.equals(exitResult)) {
				updateResult = studentService.updateAttendStat(atVo);
				if(ServiceResult.OK.equals(updateResult)) {
					result.put("result", "OK");
				}
			}
		}
		return result;
	}
}
