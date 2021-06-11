package kr.ac.shms.lms.student.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.ac.shms.lms.login.vo.UserLoginVO;

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
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Controller
public class AbsenceViewController {
	private static final Logger logger = LoggerFactory.getLogger(AbsenceViewController.class);
	
	@RequestMapping("/lms/absence.do")
	public String absence(
		@AuthenticationPrincipal(expression="realUser") UserLoginVO user
		, Model model
	) {
		return "lms/absence";
	}	
	
	@RequestMapping("/lms/absenceView.do")
	public String absenceView(
		@AuthenticationPrincipal(expression="realUser") UserLoginVO user
		, Model model
	) {
		return "lms/absenceView";
	}
	
}
