package kr.ac.shms.lms.staff.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author 박초원
 * @since 2021. 6. 23.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                  수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 6. 23.      박초원      	       최초작성
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Controller
public class electiveController {
	@RequestMapping("/lms/elective.do")
	public String elective() {
		return "lms/elective";
	}
	
	@RequestMapping("/lms/electiveForm.do")
	public String electiveForm() {
		return "lms/electiveForm";
	}
	
	@RequestMapping("/lms/electiveView.do")
	public String electiveView() {
		return "lms/electiveView"; 
	}
}
