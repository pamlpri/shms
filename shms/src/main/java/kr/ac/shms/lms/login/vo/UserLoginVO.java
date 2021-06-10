package kr.ac.shms.lms.login.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
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
@Data
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(of="user_id")
public class UserLoginVO {
	private String user_id;
	private String user_password;
	private String user_name;
	private String user_section;
	private String auth_grp_code;
	private String dept_code;
	private String sub_code;
	private boolean rememberId;
	
	public UserLoginVO(String user_id, String user_password) {
		super();
		this.user_id = user_id;
		this.user_password = user_password;
	}
}
