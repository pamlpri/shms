package kr.ac.shms.lms.student.controller;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

import kr.ac.shms.common.enumpkg.ServiceResult;
import kr.ac.shms.common.vo.RegInfoCngVO;
import kr.ac.shms.lms.login.vo.UserLoginVO;
import kr.ac.shms.lms.student.service.StudentService;
import kr.ac.shms.lms.student.service.TuitionService;

/**
 * @author 박초원
 * @since 2021. 6. 11.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일        수정자         수정내용
 * --------     --------    ----------------------
 * 2021. 6. 11.  박초원      	최초작성
 * 2021. 6. 20.  김보미			자퇴신청 
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Controller
public class DropInsertController {
	private static final Logger logger = LoggerFactory.getLogger(DropInsertController.class);
	@Inject
	private TuitionService tuitionService;
	
	@Inject
	private StudentService studentService;
	
	@RequestMapping("/lms/dropForm.do")
	public String dropForm(
		@AuthenticationPrincipal(expression="realUser") UserLoginVO user
		, @RequestParam(value="cng_req_no", required=false) Integer cng_req_no
		, Model model
	) {
		String stdnt_no = user.getUser_id();
		
		/** 서비스 호출 **************************************************************/
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("stdnt_no", stdnt_no);
		paramMap.put("cng_req_no", cng_req_no);
		tuitionService.SchlReqForm(paramMap);
		/*****************************************************************************/
		
		/** 자료 구성 ****************************************************************/
		model.addAttribute("student", paramMap.get("student"));
		model.addAttribute("cng", paramMap.get("cng"));
		/*****************************************************************************/
		
		return "lms/dropForm";
	}	
	
	@RequestMapping(value="/lms/insertDrop.do", method=RequestMethod.POST)
	public String insertDrop(
		@AuthenticationPrincipal(expression="realUser") UserLoginVO user
		, @RequestPart("common_files") MultipartFile common_files	
		, @ModelAttribute("drop") RegInfoCngVO drop
		) {
		String stdnt_no = user.getUser_id();
		drop.setBo_writer(stdnt_no);
		drop.setBiz_type("JT");
		
		ServiceResult result = studentService.insertDrop(drop);
		
		String view = null;
		if(ServiceResult.OK.equals(result)) {
			view = "redirect:/lms/drop.do";
		}
		
		return view;
	}
}
