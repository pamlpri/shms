package kr.ac.shms.lms.login.dao;

import org.springframework.stereotype.Repository;

import kr.ac.shms.common.enumpkg.ServiceResult;
import kr.ac.shms.lms.login.vo.UserLoginVO;

@Repository
public interface LoginDAO {
	/**
	 * login 체크
	 * @param user
	 * @return "OK" 이면 성공, "FAIL" 이면 실패, "INVALIDPASSWORD" 이면 비밀번호 불일치, 
	 */
	public UserLoginVO checkLogin(UserLoginVO user);
	/**
	 * PK 를 기준으로 한명의 회원 조회(인증용)
	 * @param mem_id
	 * @return 존재하지 않는 경우, null 반환.
	 */
	public UserLoginVO selectMemberForAuth(String user_id);
}
