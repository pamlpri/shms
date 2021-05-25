package kr.ac.shms.lms.staff.controller;

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

@Controller
public class LmsIndexController {
	private static final Logger logger = LoggerFactory.getLogger(LmsIndexController.class);
	@Inject
	private LmsStaffService service;
	
	@RequestMapping("/lms/main.do")
	public String index(
		@AuthenticationPrincipal(expression="realUser") UserLoginVO user
		, Model model
	){
//		UserLoginVO user = (UserLoginVO) session.getAttribute("user");
		StaffVO staffVO = service.staff(user.getUser_id());
		if(staffVO != null) {
			model.addAttribute("staff", staffVO);
		}
		return "lms/main";
	}
}
