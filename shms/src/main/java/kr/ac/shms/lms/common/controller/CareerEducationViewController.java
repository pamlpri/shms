package kr.ac.shms.lms.common.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.ac.shms.lms.common.service.LmsCommonService;
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
public class CareerEducationViewController {
	private static final Logger logger = LoggerFactory.getLogger(CareerEducationViewController.class);
	@Inject
	private LmsCommonService lmsCommonService;
	
	@RequestMapping("/lms/careerEducation.do")
	public String careerEducation(
		@AuthenticationPrincipal(expression="realUser") UserLoginVO user
		, Model model
	) {
		model.addAttribute("courseEducList", lmsCommonService.selectAllCourseEducList());
		return "lms/careerEducation";
	}	
	
	@RequestMapping("/lms/careerEducationView.do")
	public String careerEducationView(
		@AuthenticationPrincipal(expression="realUser") UserLoginVO user
		, @RequestParam("bo_no") int boNo
		, Model model
	) {
		model.addAttribute("courseEduc", lmsCommonService.selectCourseEduc(boNo));
		return "lms/careerEducationView";
	}
}
