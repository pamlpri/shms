package kr.ac.shms.lms.staff.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author 박초원
 * @since 2021. 6. 21.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                  수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 6. 21.      박초원      	       최초작성
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Controller
public class CertificateScholarshipController {
	@RequestMapping("/lms/certificateScholarship.do")
	public String certificateScholarship() {
		return "lms/certificateScholarship";
	}
	
	@RequestMapping("/lms/certificateScholarshipView.do")
	public String certificateScholarshipView() {
		return "lms/certificateScholarshipView";
	}
	
	@RequestMapping("/lms/certificateScholarshipDetailView.do")
	public String certificateScholarshipDetailView() {
		return "lms/certificateScholarshipDetailView";
	}
}
