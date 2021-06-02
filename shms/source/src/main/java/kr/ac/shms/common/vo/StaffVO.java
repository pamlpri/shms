package kr.ac.shms.common.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

/**
 * 교직원 (교수, 학생지원과, 학적과, 취업지원과, 입학과)
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(of="staff_no")
public class StaffVO {
	private String staff_no;
	private String dept_code;
	private String sub_code;
	private String emp_section;
	private String encpn_de;
	private String retire_de;
	private String contract_endde;
	private String staff_rspofc;
	private String prof_at;
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
	private String dean_at;	// 학과장 여부
}
