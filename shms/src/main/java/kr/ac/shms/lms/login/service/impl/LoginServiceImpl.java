package kr.ac.shms.lms.login.service.impl;

import java.lang.reflect.InvocationTargetException;
import java.security.NoSuchAlgorithmException;

import javax.inject.Inject;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import kr.ac.shms.common.enumpkg.ServiceResult;
import kr.ac.shms.lms.login.dao.LoginDAO;
import kr.ac.shms.lms.login.service.LoginService;
import kr.ac.shms.lms.login.vo.MemberUserDetails;
import kr.ac.shms.lms.login.vo.UserLoginVO;
import kr.ac.shms.utils.CryptoUtil;

@Service("authService")
public class LoginServiceImpl implements LoginService, UserDetailsService {
	private static final Logger logger = LoggerFactory.getLogger(LoginServiceImpl.class);
	@Inject
	private LoginDAO dao;
	
	@Inject
	private PasswordEncoder encoder;
	
	@Override
	public ServiceResult authenticate(UserLoginVO user) {
		logger.info("user : {}", user.toString());
		logger.info("userId : {}", user.getUser_id());
		UserLoginVO savedMember = dao.selectMemberForAuth(user.getUser_id());
		ServiceResult result = null;
		if(savedMember!=null) {
			String inputPass = user.getUser_password();
			logger.info("inputpass : {}", inputPass);
			try {
//				String encodedPass = encoder.encode(inputPass);
				String savedPass = savedMember.getUser_password();
				logger.info("savedpass : {}", savedPass);
				if(encoder.matches(inputPass, savedPass)) {
					try {
						BeanUtils.copyProperties(user, savedMember);
					} catch (IllegalAccessException | InvocationTargetException e) {
						throw new RuntimeException(e);
					}
					result = ServiceResult.OK;
				}else {
					result = ServiceResult.INVALIDPASSWORD;
				}
			}catch (Exception e) {
				logger.error("", e);
				result = ServiceResult.FAIL;
			}
		}else {
			logger.info("savedMember 널이다");
			result = ServiceResult.NOTEXIST;
		}
		return result;
	}
	
	/**
	 * 비밀번호 암호화 작업
	 * @param user
	 */
	private void encryptPassword(UserLoginVO user) {
	 	String inputPass = user.getUser_password();
	 	if(StringUtils.isNotBlank(inputPass)) {
	 		try {
	 			System.out.println(CryptoUtil.sha512(inputPass));
	 			user.setUser_password(CryptoUtil.sha512(inputPass));
			} catch (NoSuchAlgorithmException e) {}
	 	}
	}

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		UserLoginVO savedUser = dao.selectMemberForAuth(username);
		return new MemberUserDetails(savedUser);
	}
}
