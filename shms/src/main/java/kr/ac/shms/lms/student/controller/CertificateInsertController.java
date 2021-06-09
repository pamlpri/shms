package kr.ac.shms.lms.student.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.ac.shms.common.enumpkg.ServiceResult;
import kr.ac.shms.lms.login.vo.UserLoginVO;
import kr.ac.shms.lms.student.service.CertificateService;
import kr.ac.shms.lms.student.vo.CertificateReqVO;
import kr.ac.shms.validator.CertificateInsertGroup;

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
 * 2021. 6. 9.   김보미 		증명서 신청 내역 저장
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
			@Validated(CertificateInsertGroup.class)
			@AuthenticationPrincipal(expression="realUser") UserLoginVO user
			, @ModelAttribute("crtf") CertificateReqVO crtf
			, Model model
			, Errors errors
			) {
		boolean valid = !errors.hasErrors();
		String view = null;
		String message = null;	
		
		if("재학증명서".equals(crtf.getCrtf_kind())) {
			crtf.setCrtf_kind("JH"); 
		}else if("휴학증명서".equals(crtf.getCrtf_kind())) {
			crtf.setCrtf_kind("HH"); 
		}else if("졸업증명서".equals(crtf.getCrtf_kind())) {
			crtf.setCrtf_kind("JU"); 
		}else if("성적증명서".equals(crtf.getCrtf_kind())) {
			crtf.setCrtf_kind("SJ"); 
		}
		
		crtf.setCrtf_kind(crtf.getCrtf_kind());
		crtf.setNo_of_issue(crtf.getNo_of_issue());
		crtf.setCrtf_req_resn(crtf.getCrtf_req_resn());
		crtf.setStdnt_no(user.getUser_id());
		crtf.setCrtf_price(crtf.getCrtf_price());
		if(valid) {
			ServiceResult result = certificateService.insertCrtfReq(crtf); 
			if(ServiceResult.OK.equals(result)) {
				crtf.setStdnt_no(user.getUser_id());
				crtf = certificateService.selectCrtf(crtf);
				view = "redirect:/lms/certificateStorage.do";
			}else {
				message = "증명서 신청 실패! 잠시 후에 다시 시도해주세요.";
				view = "lms/certificateChoice";
			}
		}else {
			message = "암튼 에러";
			view = "lms/certificateChoice";
		}
		model.addAttribute("message", message);
		return view;
	}
}