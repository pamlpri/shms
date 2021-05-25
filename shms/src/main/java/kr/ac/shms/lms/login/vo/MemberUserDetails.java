package kr.ac.shms.lms.login.vo;

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
