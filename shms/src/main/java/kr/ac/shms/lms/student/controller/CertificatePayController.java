package kr.ac.shms.lms.student.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.MediaType;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;

import kr.ac.shms.common.enumpkg.MimeType;
import kr.ac.shms.common.enumpkg.ServiceResult;
import kr.ac.shms.lms.login.vo.UserLoginVO;
import kr.ac.shms.lms.student.service.CertificateService;
import kr.ac.shms.lms.student.service.StudentService;
import kr.ac.shms.lms.student.vo.CertificateReqVO;
import kr.ac.shms.lms.student.vo.StudentVO;
/**
 * @author 박초원
 * @since 2021. 6. 3.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일         수정자      수정내용
 * --------     --------    ----------------------
 * 2021. 6. 3.    박초원      최초작성
 * 2021. 6. 7.    김보미	  결제 구현		 
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Controller
public class CertificatePayController {
	private static final Logger logger = LoggerFactory.getLogger(CertificatePayController.class);
	
	@Inject
	private StudentService studentService;
	
	@Inject
	private CertificateService certificateService;
	
	@RequestMapping("/lms/certificatePay.do")
	public String certificatePay(
		@AuthenticationPrincipal(expression="realUser") UserLoginVO user
		, @RequestParam("crtf_kind") String crtf_kind
		, @RequestParam("no_of_issue") int no_of_issue
		, @RequestParam("crtf_req_resn") String crtf_req_resn
		, Model model
	) {
		StudentVO studentVO = studentService.selectStdntInfoForCetf(user.getUser_id());

		crtf_kind = certificateService.selectCrtfKind(crtf_kind);
		
		model.addAttribute("student", studentVO);
		model.addAttribute("crtf_kind", crtf_kind);
		model.addAttribute("no_of_issue", no_of_issue);
		model.addAttribute("won", no_of_issue*2000);
		
		return "lms/certificatePay";
	}
}
