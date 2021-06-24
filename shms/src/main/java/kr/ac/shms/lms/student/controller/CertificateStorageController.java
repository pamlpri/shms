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
import org.springframework.web.bind.annotation.ModelAttribute;
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

/**
 * @author 박초원
 * @since 2021. 6. 3.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일        수정자       수정내용
 * --------     --------    ----------------------
 * 2021. 6. 3.   박초원       최초작성
 * 2021. 6. 7.   김보미       증명서보관함 내역 조회
 * 2021. 6. 9.   김보미		  증명서 출력을 위한 데이터 전달 
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Controller
public class CertificateStorageController {
	private static final Logger logger = LoggerFactory.getLogger(WebmailInsertController.class);
	
	@Inject
	private StudentService studentService;
	
	@Inject
	private CertificateService certificafeService;
	
	@RequestMapping("/lms/certificateStorage.do")
	public String certificatePay(
		@RequestParam(value="page", required=false, defaultValue="1") int currentPage
		, @AuthenticationPrincipal(expression="realUser") UserLoginVO user
		, Model model
	) {
		StudentVO studentVO = studentService.student(user.getUser_id());
		
		List<CertificateReqVO> crtfList = certificafeService.selectCrtfList(user.getUser_id());
		model.addAttribute("crtfList", crtfList);
		model.addAttribute("student", studentVO);
		
		return "lms/certificateStorage";
	}
	
	@RequestMapping(value="/lms/updateIssue.do", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public String updateIssue(
		@AuthenticationPrincipal(expression="realUser") UserLoginVO user
		, @ModelAttribute("crtf") CertificateReqVO crtf
		, HttpServletResponse resp
		) throws IOException {
		String stdnt_no = crtf.getStdnt_no();
		int req_no = crtf.getReq_no();
		int lssued_cnt = crtf.getIssued_cnt();
		int no_of_issue = crtf.getNo_of_issue();
		String str = crtf.getEnd_de();
		int end_de = Integer.parseInt(str.replaceAll("[^0-9]", ""));
		
		Map<String, Object> resultMap = new HashMap<>();
		ServiceResult result = certificafeService.updateIssuedCnt(req_no);
		
		/** 검증*****************************************/
		if(stdnt_no == user.getUser_id() || (no_of_issue != lssued_cnt) || end_de != 0) {
			if(ServiceResult.OK.equals(result)) {
				resultMap.put("result", ServiceResult.OK);
			}else if(ServiceResult.FAIL.equals(result)) {
				resultMap.put("result", ServiceResult.FAIL);
			}
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





