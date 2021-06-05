package kr.ac.shms.lms.student.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.ac.shms.common.dao.OthersDAO;
import kr.ac.shms.lms.login.vo.UserLoginVO;
import kr.ac.shms.lms.student.service.StudentService;
import kr.ac.shms.lms.student.vo.StudentVO;
import kr.ac.shms.lms.student.vo.SugangVO;
import kr.ac.shms.subject.vo.SubjectVO;

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
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */

@Controller
public class ClassCartViewController {
	@Inject
	private StudentService studentService;
	@Inject
	private OthersDAO othersDAO;
	
	private void addAttribute(Model model) {
		List<Map<String, Object>> collegeList = othersDAO.selectCollegeList();
		List<SubjectVO> subjectList = othersDAO.selectSubjectList(null);
		model.addAttribute("collegeList", collegeList);
		model.addAttribute("subjectList", subjectList);
	}
	
	@RequestMapping("/lms/classCartInfo.do")
	public String classRegistrationInfo (
		@AuthenticationPrincipal(expression="realUser") UserLoginVO user
		, Model model
	) {
		String user_id = user.getUser_id();
		StudentVO studentVO = studentService.student(user_id);
		
		model.addAttribute("student", studentVO);
		
		return  "lms/classCartInfo";
	}
	

	@RequestMapping("/lms/classCart.do")
	public String classRegistration(
		@AuthenticationPrincipal(expression="realUser") UserLoginVO user
		, Model model
	) {
		String user_id = user.getUser_id();
		StudentVO studentVO = studentService.student(user_id);
		
		model.addAttribute("student", studentVO);
		
		return  "lms/classCart";
	}
}
