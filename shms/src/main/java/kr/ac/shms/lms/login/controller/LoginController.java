package kr.ac.shms.lms.login.controller;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author 최희수
 * @since 2021. 05. 22.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 05. 22.  사용자명          최초작성
 * 2021. 05. 26.  최희수             security 적용된 DAO
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Controller
@RequestMapping("/lms")
public class LoginController {
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
		
	@RequestMapping("/login.do")
	public String sendViewLogin() {
		return "/lms/login";
	}
}
