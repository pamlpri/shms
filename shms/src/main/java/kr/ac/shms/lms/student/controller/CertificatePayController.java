package kr.ac.shms.lms.student.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
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
 * 2021. 6. 7.    김보미	  결제 구현		 
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Controller
public class CertificatePayController {
	private static final Logger logger = LoggerFactory.getLogger(WebmailInsertController.class);
	
	@Inject
	private StudentService studentService;
	
	@RequestMapping("/lms/certificatePay.do")
	public String certificatePay(
		@AuthenticationPrincipal(expression="realUser") UserLoginVO user
		, @ModelAttribute("cetfInfo") ComCodeVO cetf
		, Model model
	) {
		StudentVO studentVO = studentService.student(user.getUser_id());
		System.out.println(cetf.getCom_code_nm());
		model.addAttribute("student", studentVO);
		
		model.addAttribute("comcode", cetf);
		return "lms/certificatePay";
	}
}













