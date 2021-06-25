package kr.ac.shms.common.login;

/**
 * @author 최희수
 * @since 2021-05-26
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2021-05-26      최희수          최초작성
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Service;

import kr.ac.shms.lms.login.dao.LoginDAO;
import kr.ac.shms.lms.login.vo.UserLoginVO;
import kr.ac.shms.utils.CookieUtils;

@Service
public class UserLoginSuccessHandler implements AuthenticationSuccessHandler {
	private static final Logger logger = LoggerFactory.getLogger(UserLoginSuccessHandler.class);
	@Inject
	private LoginDAO loginDAO;
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {		
		HttpSession session = request.getSession();
		UserLoginVO vo = loginDAO.selectMemberForAuth(authentication.getName());
		logger.info("UserLoginVO : {}", vo);
		
		String rememberId = request.getParameter("rememberId");
		Cookie cookie = null;
		if("on".equals(rememberId)) {
			cookie = new Cookie("checkID", vo.getUser_id());
			cookie.setMaxAge(60*60*24);
			response.addCookie(cookie);
		} else {
			cookie = new Cookie("checkID", vo.getUser_id());
			cookie.setMaxAge(0);
			response.addCookie(cookie);
		}
		String userInfo[] = new String[3];
		userInfo[0] = vo.getUser_id();
		userInfo[1] = vo.getAuth_grp_code();
		userInfo[2] = vo.getUser_name();
		
		Map<String, String[]> userMap = new HashMap<>();
		userMap.put("user", userInfo);
		session.setAttribute("user", userMap);
		String view="";
		if("ST".equals(vo.getUser_section())) {
			view = request.getContextPath()+"/lms/index.do";
		} else {
			view = request.getContextPath()+"/lms/main.do";
		}
		response.sendRedirect(view);
	}

}
