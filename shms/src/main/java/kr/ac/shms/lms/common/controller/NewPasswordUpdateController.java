package kr.ac.shms.lms.common.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.ac.shms.common.enumpkg.ServiceResult;
import kr.ac.shms.lms.common.service.LmsCommonService;
import kr.ac.shms.lms.common.vo.UsersVO;
import kr.ac.shms.lms.login.vo.UserLoginVO;

/**
 * @author 박초원
 * @since 2021. 6. 10.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                  수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 6. 10.      박초원      	       최초작성
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Controller
public class NewPasswordUpdateController {
	private static final Logger logger = LoggerFactory.getLogger(NewPasswordUpdateController.class);
	
	@Inject
	private	LmsCommonService lmsCommonService; 
	
	@Inject
	private PasswordEncoder encoder;
	
	@RequestMapping(value="lms/newPassword.do", method=RequestMethod.POST)
	public String newPassword(
		@AuthenticationPrincipal(expression="realUser") UserLoginVO userLoginVO
		, @ModelAttribute("users") UsersVO users
		, Errors errors
		, Model model
	) {
		String savePassword = userLoginVO.getUser_password();
		String saveId = userLoginVO.getUser_id();
		System.out.println("savePassword" + savePassword);
		
		String user_password = encoder.encode(users.getUser_password());
		
		users.setUser_id(saveId);
		users.setUser_password(user_password);
		
		String view = null;
		String message = null;
		
		ServiceResult result = ServiceResult.FAIL;
		
		if(encoder.matches(users.getCur_password(), savePassword)) {
			result = lmsCommonService.updateNewPassword(users);
			if(ServiceResult.OK.equals(result)) {
				view = "/lms/login";
			}else {
				message = "서버 오류입니다.";
				view = "lms/myPage";
			}
		}else {
			message = "현재 사용중인 비밀번호와 일치하지 않습니다.";
			view = "lms/myPage";
		}
		
		model.addAttribute("message", message);
		return view;
	}
}
