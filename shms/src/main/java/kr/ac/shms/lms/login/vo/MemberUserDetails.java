package kr.ac.shms.lms.login.vo;
/**
 * @author 최희수
 * @since 2021. 05. 25.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 05. 25.      최희수       최초작성
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.User;

import lombok.Getter;

@Getter
public class MemberUserDetails extends User{
	private UserLoginVO realUser;
	public MemberUserDetails(UserLoginVO adaptee) {
		super(adaptee.getUser_id(), adaptee.getUser_password(),
				AuthorityUtils.createAuthorityList(adaptee.getUser_section()));
		this.realUser = adaptee;
	}
}
