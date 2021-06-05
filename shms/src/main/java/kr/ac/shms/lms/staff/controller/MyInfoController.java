package kr.ac.shms.lms.staff.controller;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.MediaType;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ac.shms.common.enumpkg.ServiceResult;
import kr.ac.shms.common.vo.StaffVO;
import kr.ac.shms.common.vo.SubjectVO;
import kr.ac.shms.lms.login.vo.UserLoginVO;
import kr.ac.shms.lms.staff.service.LmsStaffService;
import kr.ac.shms.lms.staff.vo.PMyPageVO;

/**
 * @author 박초원
 * @since 2021. 6. 4.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                  수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 6. 4.      박초원      	       최초작성
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Controller
@RequestMapping("/lms")
public class MyInfoController {
	private static final Logger logger = LoggerFactory.getLogger(MyInfoController.class);
	@Inject
	private LmsStaffService lmsStaffService;
	
	@RequestMapping("/myInfo.do")
	public String index(
		@AuthenticationPrincipal(expression="realUser") UserLoginVO user
		, Model model
	){	
		String user_id = user.getUser_id();
		PMyPageVO staffVO = lmsStaffService.pmyPage(user_id);

		if("FW".equals(staffVO.getEmp_section())) {
			staffVO.setEmp_section_nm("정규직");
		} else if("TW".equals(staffVO.getEmp_section())) {
			staffVO.setEmp_section_nm("한시적");
		} else if("SW".equals(staffVO.getEmp_section())) {
			staffVO.setEmp_section_nm("단시간");
		}
		SubjectVO subjectVO = lmsStaffService.subject(staffVO.getSub_code());
		model.addAttribute("staff", staffVO);
		model.addAttribute("subject", subjectVO);
//		model.addAttribute("staff", staffVO);
		
		return "lms/myInfo";
	}
	
	@RequestMapping(value="/myInfo.do", method=RequestMethod.POST)
	public String mypageUpdate(
			@AuthenticationPrincipal(expression="realUser") UserLoginVO user
			, @ModelAttribute("staff") StaffVO staff
		) {
		String view = null;
		staff.setStaff_no(user.getUser_id());
		ServiceResult result = lmsStaffService.mypageUpdate(staff);
		if(ServiceResult.OK.equals(result)) {
			view = "redirect:/lms/myInfo.do";
		}
		return view;
	}
	
	@RequestMapping(value="/pWebMail.do", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public Map<String, String> webMail(
			@AuthenticationPrincipal(expression="realUser") UserLoginVO user
		) {
		ServiceResult result = lmsStaffService.webMailUpdate(user.getUser_id());
		Map<String, String> webMail = new HashMap<>();
		if(ServiceResult.OK.equals(result)) {
			StaffVO staffVO = lmsStaffService.staff(user.getUser_id());
			webMail.put("webMail", staffVO.getWebmail());
		}
		return webMail;
	}
}
