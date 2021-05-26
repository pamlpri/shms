package kr.ac.shms.lms.student.controller;
import java.util.HashMap;
import java.util.Map;

/**
 * @author 최희수
 * @since 2021. 05. 22.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 05. 22.  사용자명          최초작성
 * 2021. 05. 26.  최희수             사용자명을 session 에 저장
 * Copyright (c) ${year} by DDIT All right reserved
 * </pre>
 */
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

@Controller
public class LmsStudentIndexController {
	private static final Logger logger = LoggerFactory.getLogger(LmsStudentIndexController.class);
	@Inject
	private StudentService studentService;
	
	@RequestMapping("/lms/index.do")
	public String index(
			@AuthenticationPrincipal(expression="realUser") UserLoginVO user
			, HttpSession session
			, Model model
	) {
		StudentVO studentVO = studentService.student(user.getUser_id());
		session.setAttribute("userName", studentVO.getName());
		if(studentVO != null) {
			model.addAttribute("student", studentVO);
		}
		return "lms/index";
	}
}
