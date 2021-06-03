package kr.ac.shms.lms.student.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.ac.shms.lms.common.controller.WebmailInsertController;
import kr.ac.shms.lms.login.vo.UserLoginVO;
import kr.ac.shms.lms.student.service.StudentService;
import kr.ac.shms.lms.student.vo.StudentVO;
import kr.ac.shms.main.commuity.vo.ComCodeVO;

/**
 * @author 박초원
 * @since 2021. 6. 3.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일         수정자      수정내용
 * --------     --------    ----------------------
 * 2021. 6. 3.    박초원      최초작성
 * 2021. 6. 6.    김보미	  학생 정보 출력(증명서 신청)
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Controller
public class CertificateChoiceController {
	private static final Logger logger = LoggerFactory.getLogger(WebmailInsertController.class);
	
	@Inject
	private StudentService studentService;
	
	@RequestMapping("/lms/certificateChoice.do")
	public String certificateChoice (
		@AuthenticationPrincipal(expression="realUser") UserLoginVO user
		, Model model
	) {
		StudentVO studentVO = studentService.selectStdntInfoForCetf(user.getUser_id());
		List<ComCodeVO> cetfList = studentService.selectCetfList();
		List<ComCodeVO> cetfResnList = studentService.selectCetfResnList();
		
		model.addAttribute("student", studentVO);
		model.addAttribute("cetfList", cetfList);
		model.addAttribute("cetfResnList", cetfResnList);
		
		return  "lms/certificateChoice";
	}
}
