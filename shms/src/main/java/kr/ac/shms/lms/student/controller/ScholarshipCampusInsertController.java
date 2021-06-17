package kr.ac.shms.lms.student.controller;

import java.util.HashMap;
import java.util.Map;

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
import kr.ac.shms.lms.student.service.TuitionService;

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
	
	@RequestMapping("/lms/scholarshipCampusForm.do")
	public String scholarshipCampusForm(
		@AuthenticationPrincipal(expression="realUser") UserLoginVO user
		, Model model
	) {
		String stdnt_no = user.getUser_id();
		
		/** 서비스 호출 **************************************************************/
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("stdnt_no", stdnt_no);
		tuitionService.SchlReqForm(paramMap);
		/*****************************************************************************/
		
		/** 자료 구성 ****************************************************************/
		model.addAttribute("student", paramMap.get("student"));
		/*****************************************************************************/
		
		return "lms/scholarshipCampusForm";
	}	
	
	@RequestMapping(value="lms/insertSchlForm.do", method=RequestMethod.POST)
	public String insertSchlForm(
		@AuthenticationPrincipal(expression="realUser") UserLoginVO user
		, @RequestParam("schlship_no") int schlship_no
		) {
		
		return null;
	}
}
