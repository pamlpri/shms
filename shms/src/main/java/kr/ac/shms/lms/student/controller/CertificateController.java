package kr.ac.shms.lms.student.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author 김보미
 * @since 2021. 6. 3.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일        수정자          수정내용
 * --------     --------    ----------------------
 * 2021. 6. 3.   김보미          증명서 출력
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Controller
public class CertificateController {
	@RequestMapping("/lms/scoreCertificate.do")
	public String scoreCertificate() {
		return "/lms/certificate/score";
	}
	
	@RequestMapping("/lms/graduationCertificate.do")
	public String graduationCertificate() {
		return "/lms/certificate/graduation";
	}
	
	@RequestMapping("/lms/leaveOfAbsenceCertificate.do")
	public String leaveOfAbsenceCetificate() {
		return "/lms/certificate/leaveOfAbsence";
	}
	
	@RequestMapping("/lms/registrationCertificate.do")
	public String registrationCertificate() {
		return "/lms/certificate/registration";
		
	}
}
