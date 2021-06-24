package kr.ac.shms.lms.student.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(of="stdnt_no")
public class StudentVO {
	private Integer semstr;
	private String stdnt_no;
	private String sub_code;
	private String entsch_de;
	private String grdtn_de;
	private String empmnt_at;
	private Integer grade;
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
	
	// 증명서 신청 페이지 정보를 나타내기 위한 정보 추가
	private String sub_name;
	private String reginfo_stat;
	
	// 학생 비밀번호 변경 때문에 필요
	private String aa;
}
