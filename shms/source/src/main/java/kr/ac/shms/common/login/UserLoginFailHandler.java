package kr.ac.shms.common.login;

import java.io.IOException;

import javax.security.auth.login.AccountExpiredException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.authentication.AuthenticationServiceException;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.CredentialsExpiredException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.LockedException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.stereotype.Service;
/**
 * @author 최희수
 * @since 2021. 05. 26.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 05. 26.     최희수	최초작성
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Service
public class UserLoginFailHandler implements AuthenticationFailureHandler{
	private static final Logger logger = LoggerFactory.getLogger(UserLoginFailHandler.class);
	
	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {
		HttpSession session = request.getSession();
		if (exception instanceof AuthenticationServiceException) {
			session.setAttribute("errorMsg", "존재하지 않는 사용자입니다.");
		
		} else if(exception instanceof BadCredentialsException) {
			session.setAttribute("errorMsg", "아이디 또는 비밀번호가 틀립니다.");
			
		} else if(exception instanceof DisabledException) {
			session.setAttribute("errorMsg", "비활성화된 계정입니다..");
			
		} else if(exception instanceof CredentialsExpiredException) {
			session.setAttribute("errorMsg", "비밀번호가 만료되었습니다.");
		}
		
		String view = request.getContextPath()+"/lms/login.do";
		response.sendRedirect(view);
	}

}
