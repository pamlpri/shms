package kr.ac.shms.lms.student.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.ac.shms.lms.login.vo.UserLoginVO;
import kr.ac.shms.lms.student.service.StudentService;
import kr.ac.shms.lms.student.vo.StudentVO;
import kr.ac.shms.lms.student.vo.SugangVO;

/**
 * @author 박초원
 * @since 2021. 6. 2.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                  수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 6. 2.      박초원      	       최초작성
 * 2021. 6. 5.      송수미      		수강신청 인덱스 페이지 구현
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */

@Controller
public class ClassRegistrationViewController {
	@Inject
	private StudentService studentService;
	
	private static final Logger logger = LoggerFactory.getLogger(ClassRegistrationViewController.class);
	
	@RequestMapping("/lms/classRegistrationInfo.do")
	public String classRegistrationInfo (
		@AuthenticationPrincipal(expression="realUser") UserLoginVO user
		, HttpSession session
		, Model model
	) {
		String user_id = user.getUser_id();
		logger.info("user_id : {}", user_id);
		StudentVO studentVO = studentService.student(user_id);
		
		session.setAttribute("userName", studentVO.getName());
		model.addAttribute("student", studentVO);
		
		SugangVO sugangReqIndexInfo = studentService.selectSugangReqInfo(user_id);
		model.addAttribute("sugangReqIndexInfo", sugangReqIndexInfo);
		
		return  "lms/classRegistrationInfo";
	}
	

	@RequestMapping("/lms/classRegistration.do")
	public String classRegistration(
		@AuthenticationPrincipal(expression="realUser") UserLoginVO user
		, HttpSession session
		, Model model
	) {
		String user_id = user.getUser_id();
		StudentVO studentVO = studentService.student(user_id);
		
		session.setAttribute("userName", studentVO.getName());
		model.addAttribute("student", studentVO);
		
		SugangVO sugangReqIndexInfo = studentService.selectSugangReqInfo(user_id);
		model.addAttribute("sugangReqIndexInfo", sugangReqIndexInfo);
		
		return  "lms/classRegistration";
	}
}