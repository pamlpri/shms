package kr.ac.shms.lms.student.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.ac.shms.lms.login.vo.UserLoginVO;
import kr.ac.shms.lms.student.service.CertificateService;

/**
 * @author 김보미
 * @since 2021. 6. 3.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일        수정자         수정내용
 * --------     --------    ----------------------
 * 2021. 6. 3.   김보미         증명서 출력
 * 2021. 6. 7.   김보미 		증명서 저장
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Controller
public class CertificateInsertController {
	private static final Logger logger = LoggerFactory.getLogger(CertificateInsertController.class);
	
	@Inject
	private CertificateService certificateService;
	
	@RequestMapping(value="/lms/certificateInsert.do", method=RequestMethod.POST)
	public String insertCertificateReq(
			@AuthenticationPrincipal(expression="realUser") UserLoginVO user
			, @RequestParam("crtf_kind") String crtf_kind
			, @RequestParam("no_of_issue") int no_of_issue
			, @RequestParam("crtf_req_resn") String crtf_req_resn
			, Model model
			) {
//		boolean valid = !errors.hasErrors();
		String view = null;
		String message = null;
//		
//		CertificateReqVO crtf = new CertificateReqVO();
//		if(valid) {
//			ServiceResult result = certificateService.insertCrtfReq(crtf); 
//			if(ServiceResult.OK.equals(result)) {
//				crtf.setStdnt_no(user.getUser_id());
//				crtf = certificateService.selectCrtf(crtf);
//				view = "redirect:/lms/certificateStorage.do";
//			}else {
//				message = "증명서 신청 실패! 잠시 후에 다시 시도해주세요.";
//				view = "lms/certificateChoice";
//			}
//		}else {
//			message = "암튼 에러";
//			view = "lms/certificateChoice";
//		}
		model.addAttribute("crtf_kind", crtf_kind);
		return "lms/certificatePay";
	}
}


























