package kr.ac.shms.lms.student.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

/**
 * @author 작성자명
 * @since 2021. 6. 3.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 6. 3.      최희수         최초작성
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(of="stdnt_no")
public class MypageVO {
	private String stdnt_no;
	private String sub_code;
	private String entsch_de;
	private String grdtn_de;
	private String empmnt_at;
	private Integer grade;
	private Integer semstr;
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
	private String reginfo_stat;
}
