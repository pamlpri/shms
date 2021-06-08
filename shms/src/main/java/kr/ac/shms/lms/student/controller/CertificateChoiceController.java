package kr.ac.shms.lms.student.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
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
import kr.ac.shms.lms.common.controller.WebmailInsertController;
import kr.ac.shms.lms.login.vo.UserLoginVO;
import kr.ac.shms.lms.student.service.CertificateService;
import kr.ac.shms.lms.student.service.StudentService;
import kr.ac.shms.lms.student.vo.CertificateReqVO;
import kr.ac.shms.lms.student.vo.StudentVO;
import kr.ac.shms.main.commuity.vo.ComCodeVO;

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
 * 2021. 6. 5.    김보미	  학생 정보 출력(증명서 신청)
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Controller
public class CertificateChoiceController {
	private static final Logger logger = LoggerFactory.getLogger(WebmailInsertController.class);
	
	@Inject
	private StudentService studentService;
	
	@Inject
	private CertificateService certificateService;
	
	@RequestMapping("/lms/certificateChoice.do")
	public String certificateChoice (
		@AuthenticationPrincipal(expression="realUser") UserLoginVO user
		, Model model
	) {
		StudentVO studentVO = studentService.selectStdntInfoForCetf(user.getUser_id());
		List<ComCodeVO> cetfList = studentService.selectCetfList();
		List<ComCodeVO> cetfResnList = studentService.selectCetfResnList();
		
		model.addAttribute("student", studentVO);
		model.addAttribute("cetfList", cetfList);
		model.addAttribute("cetfResnList", cetfResnList);
		
		return  "lms/certificateChoice";
	}
	
	@RequestMapping(value="/lms/chcekReginfo.do",  produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public String checkReginfo(
		@AuthenticationPrincipal(expression="realUser") UserLoginVO user
		, @RequestParam("crtf_kind") String crtf_kind
		,HttpServletResponse resp
		) throws IOException {
		Map<String, Object> resultMap = new HashMap<>();
		String req_cl_name = studentService.reginfo(user.getUser_id());
		
		CertificateReqVO crtf = new CertificateReqVO();
		crtf.setStdnt_no(user.getUser_id());
		if(crtf_kind.equals("JH")) { 
			crtf.setCrtf_kind("BH"); 
		}else {
			crtf.setCrtf_kind(crtf_kind);
		}
		int cnt = certificateService.selectReginfoCount(crtf);
		if(cnt > 0) {
			resultMap.put("result", ServiceResult.OK);
		}else if(cnt < 0){
			resultMap.put("result", ServiceResult.FAIL);
		}
		resp.setContentType(MimeType.JSON.getMime());
		try(
			PrintWriter out = resp.getWriter();	
		){
			ObjectMapper mapper = new ObjectMapper();
			mapper.writeValue(out, resultMap);
		}
		return null;
	}
}
