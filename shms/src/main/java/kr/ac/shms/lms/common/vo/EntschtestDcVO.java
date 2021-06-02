package kr.ac.shms.lms.common.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(of="dc_no")
public class EntschtestDcVO {
	private Integer p_bo_no;
	private Integer dc_no;
	private String indvinfo_colct_agre_at;
	private String dc_section;		// 코드값
	private String dc_section_nm;	// 코드명
	private String dc_target;		// 코드값
	private String dc_target_nm;	// 코드명
	private String hischul_code;
	private String hischul_nm;
	private String dc_rsv_dt;
	private String dc_end_dt;
	private String dc_rsv_date;
	private String dc_rsv_time;
	private String dc_end_time;
	private String dc_rsv_per;
	private String rsv_per_telno;
	private String rsv_per_email;
	private String rsv_per_password;
	private String lecrum_info;
}
