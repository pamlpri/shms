package kr.ac.shms.lms.student.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
	private StudentService service;
	
	@RequestMapping("/lms/index.do")
	public String index(
			HttpSession session
			, Model model
	) {
		UserLoginVO user = (UserLoginVO) session.getAttribute("user");
		StudentVO studentVO = service.student(user.getUser_id());
		if(studentVO != null) {
			model.addAttribute("student", studentVO);
		}
		return "lms/index";
	}
}
