package kr.ac.shms.lms.staff.controller;

import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.ac.shms.common.vo.StaffVO;
import kr.ac.shms.lms.login.vo.UserLoginVO;
import kr.ac.shms.lms.staff.service.LmsStaffService;

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
public class MyInfoController {
	private static final Logger logger = LoggerFactory.getLogger(MyInfoController.class);
	@Inject
	private LmsStaffService lmsStaffService;
	
	@RequestMapping("/lms/myInfo.do")
	public String index(
		@AuthenticationPrincipal(expression="realUser") UserLoginVO user
		, Model model
	){	
		String user_id = user.getUser_id();
		StaffVO staffVO = lmsStaffService.staff(user_id);
		
		model.addAttribute("staff", staffVO);
		
		return "lms/myInfo";
	}
}
