package kr.ac.shms.lms.common.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(of="user_id")
public class UsersVO {
	private String user_id;
	private String user_password;
	private String user_section;
	private String cur_password;
}
