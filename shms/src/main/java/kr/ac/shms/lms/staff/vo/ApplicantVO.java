package kr.ac.shms.lms.staff.vo;

import java.util.Map;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(of="applicnt_no")
public class ApplicantVO {
	private String photo_path;
	private String col_code;
	private String sub_code;
	private String col_name;
	private String sub_name;
	private Integer rcrt_year;
	private String reg_pay_at;
	private String virtual_account;
	private String reg_pay_date;
	private String applicnt_no;
	private String name;
	private String regno1;
	private String regno2;
	private String addr1;
	private String addr2;
	private String gen;
	private String zipcode;
	private String telno;
	private String email;
	private String hischul_code;
	private Integer comput_score;
	private String aplc_de;
	private String pass_at;
	private Integer pre_no;
	private String rcrt_cl;
	private String rcrt_type;
	private String account;
	private String bank_name;
	private Map<String, Object> searchMap;
}
