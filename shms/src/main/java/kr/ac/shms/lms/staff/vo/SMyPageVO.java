package kr.ac.shms.lms.staff.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(of="staff_no")
public class SMyPageVO {
	private String staff_no;
	private String encpn_de;
	private String retire_de;
	private String contract_endde;
	private String dept_code;
	private String dept_nm;
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
	private String account;
	private String bank_name;
	private String photo_path;
	private String rspofc;
}
