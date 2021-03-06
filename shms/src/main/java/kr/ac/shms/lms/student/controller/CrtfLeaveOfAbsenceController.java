package kr.ac.shms.lms.student.controller;

import javax.inject.Inject;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.ac.shms.lms.login.vo.UserLoginVO;
import kr.ac.shms.lms.student.service.CertificateService;
import kr.ac.shms.lms.student.vo.CertificateReqVO;
/**
 * @author 김보미
 * @since 2021. 6. 9.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일        수정자       수정내용
 * --------     --------    ----------------------
 * 2021. 6. 9.   김보미       최초작성
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Controller
public class CrtfLeaveOfAbsenceController {
	@Inject
	private CertificateService certificateService;
	
	@RequestMapping("/lms/leaveOfAbsenceCertificate.do")
	public String leaveOfAbsenceCertificate(
		@AuthenticationPrincipal(expression="realUser") UserLoginVO user
		, @RequestParam("req_no") int req_no
		, Model model				
		) {
		CertificateReqVO crtf = new CertificateReqVO();
		crtf.setReq_no(req_no);
		crtf.setStdnt_no(user.getUser_id());
		crtf = certificateService.selectCrtfPrint(crtf);
		
		CertificateReqVO huhak = certificateService.selectHH(user.getUser_id());
		model.addAttribute("huhak", huhak);
		model.addAttribute("crtf", crtf);
		
		return "lms/certificate/leaveOfAbsence";
	}
}
