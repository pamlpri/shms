package kr.ac.shms.lms.login.service;

import kr.ac.shms.common.enumpkg.ServiceResult;
import kr.ac.shms.lms.login.vo.UserLoginVO;

public interface LoginService {
	/**
	 * login 체크
	 * @param user
	 * @return "OK" 이면 성공, "FAIL" 이면 실패, "INVALIDPASSWORD" 이면 비밀번호 불일치, 
	 */
//	public UserLoginVO checkLogin(UserLoginVO user);
	/**
	 * 로그인 인증, 인감 처리
	 * @param user
	 * @return 로그인 성공하면 "OK" 반환, 로그인 실패 시 "FAIL" 반환, 비밀번호 틀렸을 시 "INVALIDPASSWORD" 반환
	 */
	public ServiceResult authenticate(UserLoginVO user);
}
