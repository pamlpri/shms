package kr.ac.shms.lms.student.controller;

import javax.inject.Inject;

import org.springframework.http.MediaType;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ac.shms.common.enumpkg.ServiceResult;
import kr.ac.shms.lms.login.vo.UserLoginVO;
import kr.ac.shms.lms.student.service.CertificateService;
import kr.ac.shms.lms.student.vo.CertificateReqVO;

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
	@Inject
	private CertificateService certificateService;
	
	@RequestMapping(value="/lms/certificateInsert.do", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public CertificateReqVO insertCertificateReq(
			@AuthenticationPrincipal(expression="realUser") UserLoginVO user
			, Errors errors
			) {
		boolean valid = !errors.hasErrors();
		
		String view = null;
		String message = null;
		
		CertificateReqVO crtf = new CertificateReqVO();
		if(valid) {
			ServiceResult result = certificateService.insertCrtfReq(crtf); 
			if(ServiceResult.OK.equals(result)) {
				view = "redirect:/lms/certificateStorage.do";
			}else {
				message = "증명서 신청 실패! 잠시 후에 다시 시도해주세요.";
				view = "lms/certificateChoice";
			}
		}else {
			message = "암튼 에러";
			view = "lms/certificateChoice";
		}
		
		return crtf;
	}
}



























