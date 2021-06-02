package kr.ac.shms.lms.login.dao;

import org.springframework.stereotype.Repository;

import kr.ac.shms.common.enumpkg.ServiceResult;
import kr.ac.shms.lms.login.vo.UserLoginVO;
/**
 * @author 최희수
 * @since 2021-05-22
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2021-05-22      최희수          최초작성
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Repository
public interface LoginDAO {
	/**
	 * PK 를 기준으로 한명의 회원 조회(인증용)
	 * @param mem_id
	 * @return 존재하지 않는 경우, null 반환.
	 */
	public UserLoginVO selectMemberForAuth(String user_id);
}
