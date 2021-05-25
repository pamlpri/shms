package kr.ac.shms.lms.login.controller;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.ac.shms.common.enumpkg.ServiceResult;
import kr.ac.shms.lms.login.service.LoginService;
import kr.ac.shms.lms.login.vo.UserLoginVO;


@Controller
@RequestMapping("/lms")
public class LoginController {
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	@Inject
	private LoginService service;
	
	@RequestMapping("/login.do")
	public String sendViewLogin() {
		return "/lms/login";
	}
	
	@RequestMapping(value="/loginProcess.do", method=RequestMethod.POST)
	public String selectLogin(
			@RequestParam(value="rememberId", required=false) boolean rememberId
			, @ModelAttribute UserLoginVO user
			, HttpSession session
			, HttpServletResponse resp
		) {
		String view = "";
		String message = "";
		logger.info("user : {}", user.toString());
		ServiceResult idCheck = service.authenticate(user);
		if(ServiceResult.OK.equals(idCheck)) {
			if(rememberId) {
				Cookie cookie = new Cookie("checkID" , user.getUser_id());
				cookie.setMaxAge(60*60*24*7);
				resp.addCookie(cookie);
			}
//			UserLoginVO userVO = service.checkLogin(user);
			session.setAttribute("user", user);
			if("HS".equals(user.getUser_section())) {	// 학생
				view = "redirect:/lms/index.do";
			} else {
				view = "redirect:/lms/main.do";
			}			
		} else {
			message = "아이디와 비밀번호가 일치하지 않습니다.";
			view = "/lms/login";
		}
		return view;
	}
	
	@RequestMapping("/logout.do")
	public String sendViewLogout(
		HttpSession session
	) {
		session.invalidate();
		return "redirect:/lms/login.do";
	}
}
