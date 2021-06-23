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
public class MajorController {
	@RequestMapping("/lms/major.do")
	public String major() {
		return "lms/major";
	}
	
	@RequestMapping("/lms/majorForm.do")
	public String majorForm() {
		return "lms/majorForm";
	}
	
	@RequestMapping("/lms/majorView.do")
	public String majorView() {
		return "lms/majorView";
	}
}
