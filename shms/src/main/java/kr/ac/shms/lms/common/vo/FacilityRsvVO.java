package kr.ac.shms.lms.common.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(of="rsv_no")
public class FacilityRsvVO {
	private Integer rsv_no;
	private Integer facility_no;
	private String facility_kind;	// 편의시설 종류 코드
	private String facility_nm;		// 편의시설 종류 이름
	private String rsv_fac_info;	// 예약한 편의시설 상세
	
	private String rsv_dt;
	private String use_begin_dt;
	private String use_end_dt;
	private String real_bg_dt;
	private String real_end_dt;
	private String stdnt_no;
	private String stdnt_name;
    
    private String use_begin_date;
    private String use_begin_time;
    private String use_end_time;
    private String real_bg_date;
    private String real_bg_time;
    private String real_end_time;
}
