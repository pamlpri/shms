package kr.ac.shms.lms.staff.controller;

import java.util.List;

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

import kr.ac.shms.common.enumpkg.ServiceResult;
import kr.ac.shms.lms.login.vo.UserLoginVO;
import kr.ac.shms.lms.staff.service.LmsStaffService;
import kr.ac.shms.lms.student.vo.ConsultingVO;

/**
 * @author 박초원
 * @since 2021. 6. 7.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                  수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 6. 7.      박초원      	       최초작성
 * 2021. 6. 7.		최희수		상담 내역
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Controller
@RequestMapping("/lms")
public class ConsultingAdminController {
	private static final Logger logger = LoggerFactory.getLogger(ConsultingAdminController.class);
	@Inject
	private LmsStaffService lmsStaffService;
	
	@RequestMapping("/consultingAdmin.do")
	public String sendForm (
		@AuthenticationPrincipal(expression="realUser") UserLoginVO user
		, Model model
	){
		String user_id = user.getUser_id();
		
		List<ConsultingVO> consultingList = lmsStaffService.consultingList(user_id);
		
		model.addAttribute("consultingList", consultingList);
		
		return  "lms/consultingAdmin";
	}
	
	@RequestMapping(value="/consultingAdmin.do", method=RequestMethod.POST)
	public String consultingUpdate(
			@ModelAttribute("consulting") ConsultingVO consultingVO
			, @RequestParam("approval") String approval
		) {
		ServiceResult result = null;
		if("companion".equals(approval)) {	// 상담 반려일 경우
			result = lmsStaffService.consultingCompanion(consultingVO);
		} else if("approval".equals(approval)) {	// 상담 승인일 경우
			result = lmsStaffService.consultingApproval(consultingVO.getReq_no());
		}
		
		String view = null;
		if(ServiceResult.OK.equals(result)) {
			view = "redirect:/lms/consultingAdmin.do";
		}
		return view;
	}
}
