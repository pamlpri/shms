package kr.ac.shms.lms.login.service.impl;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.server.ServletServerHttpRequest;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import kr.ac.shms.lms.login.dao.LoginDAO;
import kr.ac.shms.lms.login.vo.MemberUserDetails;
import kr.ac.shms.lms.login.vo.UserLoginVO;
/**
 * @author 최희수
 * @since 2021. 05. 22.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 05. 22.      최희수       최초작성
 * 2021. 05. 26.	   최희수 	 security로 인증처리 내용 추가
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Service("authService")
public class LoginServiceImpl implements UserDetailsService {
	private static final Logger logger = LoggerFactory.getLogger(LoginServiceImpl.class);
	@Inject
	private LoginDAO loginDao;
	
	@Inject
	private PasswordEncoder encoder;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		UserLoginVO savedUser = loginDao.selectMemberForAuth(username);
		logger.info("UserDetail: {}", savedUser);
		return new MemberUserDetails(savedUser);
	}
	
}
