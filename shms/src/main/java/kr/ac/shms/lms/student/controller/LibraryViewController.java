package kr.ac.shms.lms.student.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.ac.shms.lms.login.vo.UserLoginVO;
import kr.ac.shms.lms.student.service.StudentService;
import kr.ac.shms.lms.student.vo.BookVO;

/**
 * @author 박초원
 * @since 2021. 6. 11.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                  수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 6. 11.      박초원      	       최초작성
 * 2021. 6. 18.		  최희수		도서관 목록조회, 대출,연체
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Controller
public class LibraryViewController {
	private static final Logger logger = LoggerFactory.getLogger(LibraryViewController.class);
	@Inject
	private StudentService studentService;
	@RequestMapping("/lms/library.do")
	public String library(
		@AuthenticationPrincipal(expression="realUser") UserLoginVO user
		, Model model
	) {
		List<BookVO> bookList = studentService.selectBookList();
		model.addAttribute("bookList", bookList);
		
		List<BookVO> bookLoanList = studentService.selectBookLoanList(user.getUser_id());
		model.addAttribute("bookLoanList", bookLoanList);
		
		return "lms/library";
	}	
}
