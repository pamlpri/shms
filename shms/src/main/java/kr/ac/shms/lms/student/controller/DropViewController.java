package kr.ac.shms.lms.student.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.ac.shms.common.vo.RegInfoCngVO;
import kr.ac.shms.lms.login.vo.UserLoginVO;
import kr.ac.shms.lms.student.service.StudentService;

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
public class DropViewController {
	private static final Logger logger = LoggerFactory.getLogger(DropViewController.class);
	@Inject
	private StudentService studentService;
	
	@RequestMapping("/lms/drop.do")
	public String drop(
		@AuthenticationPrincipal(expression="realUser") UserLoginVO user
		, Model model
	) {
		String stdnt_no = user.getUser_id();
		List<RegInfoCngVO> dropList = studentService.selectRegInfoCngStudentList(stdnt_no);
		
		 model.addAttribute("dropList", dropList);
		return "lms/drop";
	}	
	
	@RequestMapping("/lms/dropView.do")
	public String dropView(
		@AuthenticationPrincipal(expression="realUser") UserLoginVO user
		, @RequestParam("cng_req_no") int cng_req_no
		, Model model
	) {
		String stdnt_no = user.getUser_id();
		RegInfoCngVO cng = new RegInfoCngVO();
		cng.setStdnt_no(stdnt_no);
		cng.setCng_req_no(cng_req_no);
		cng = studentService.selectReginfoCng(cng);
		model.addAttribute("cng", cng);
		return "lms/dropView";
	}
	
}
