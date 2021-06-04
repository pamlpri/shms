package kr.ac.shms.lms.common.vo;

import java.util.List;
import java.util.Map;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(of="user_no")
public class UserVO {
	private String user_no;
	private String dept_code;
	private String sub_code;
	private String name;
	private String tel_no;
	private String regno1;
	private String regno2;
	private String gen;
	private String zipcode;
	private String addr1;
	private String addr2;
	private String email;
	private String webmail;
	private String photo_path;
	private String sub_name;
	private String dept_nm;
	
	private List<UserVO> userList;
	private Map<String, Object> searchMap;
}
