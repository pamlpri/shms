package kr.ac.shms.lms.student.controller;

import java.util.HashMap;
import java.util.List;
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
import kr.ac.shms.common.service.CommonAttachService;
import kr.ac.shms.common.service.impl.CommonAttachServiceImpl;
import kr.ac.shms.lms.login.vo.UserLoginVO;
import kr.ac.shms.lms.student.service.TuitionService;
import kr.ac.shms.lms.student.vo.EditReqVO;
import kr.ac.shms.lms.student.vo.ScholarShipVO;
import kr.ac.shms.lms.student.vo.StudentVO;

/**
 * @author 박초원
 * @since 2021. 6. 11.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일         수정자        수정내용
 * --------     --------    ----------------------
 * 2021. 6. 11.   박초원      	최초작성
 * 2021. 6. 17.   김보미		장학금 신청 
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Controller
public class ScholarshipCampusInsertController {
	private static final Logger logger = LoggerFactory.getLogger(ScholarshipCampusInsertController.class);
	
	@Inject
	private TuitionService tuitionService;

	@Inject
	private CommonAttachServiceImpl commonAttachServiceImpl; 
	
	@RequestMapping("/lms/scholarshipCampusForm.do")
	public String scholarshipCampusForm(
		@AuthenticationPrincipal(expression="realUser") UserLoginVO user
		, @RequestParam(value="req_no", required=false) Integer req_no
		, @RequestParam(value="req_no", required=false) String state
		, Model model
	) {
		String stdnt_no = user.getUser_id();
		
		/** 서비스 호출 **************************************************************/
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("stdnt_no", stdnt_no);
		paramMap.put("req_no", req_no);
		tuitionService.SchlReqForm(paramMap);
		/*****************************************************************************/
		
		/** 자료 구성 ****************************************************************/
		model.addAttribute("student", paramMap.get("student"));
		model.addAttribute("schl", paramMap.get("schl"));
		model.addAttribute("attList", paramMap.get("attList"));
		/*****************************************************************************/
		
		System.out.println("**************************************");
		logger.info("schl {}", paramMap.get("schl"));
		
		return "lms/scholarshipCampusForm";
	}	
	
	@RequestMapping(value="lms/insertSchl.do", method=RequestMethod.POST)
	public String insertSchl(
		@AuthenticationPrincipal(expression="realUser") UserLoginVO user
		, @RequestPart("common_files") MultipartFile common_files
		, @ModelAttribute("schl") ScholarShipVO schl
		) {
		String stdnt_no = user.getUser_id();
		schl.setBo_writer(stdnt_no);
		schl.setBiz_type("JS");
		
		ServiceResult result = tuitionService.insertSchl(schl);

		String view = null;
		if(ServiceResult.OK.equals(result)) {
			view = "redirect:/lms/scholarshipCampus.do";
		}
		
		return view;
	}
	
	@RequestMapping(value="lms/updateSchl.do", method=RequestMethod.POST)
	public String updateSchl(
		@AuthenticationPrincipal(expression="realUser") UserLoginVO user
		, @RequestPart("common_files") MultipartFile common_files
		,  @ModelAttribute("schl") ScholarShipVO schl
		) {
		
		return "redirect:/lms/scholarshipCampus.do";
	}
	
	@RequestMapping(value="lms/deleteSchl.do", method=RequestMethod.POST)
	public String deleteSchl(
		@ModelAttribute("schl") ScholarShipVO schl	
		) {
		ServiceResult result = tuitionService.deleteSchl(schl);
		String view = null;
		if(ServiceResult.OK.equals(result)) {
			view = "redirect:/lms/scholarshipCampus.do";
		}
		return view;
	}
	

	
}
