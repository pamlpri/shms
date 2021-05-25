package kr.ac.shms.lms.login.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(of="user_id")
public class UserLoginVO {
	private String user_id;
	private String user_password;
	private String user_section;
	private String dept_code;
	private String user_name;
	
	public UserLoginVO(String user_id, String user_password) {
		super();
		this.user_id = user_id;
		this.user_password = user_password;
	}
}
