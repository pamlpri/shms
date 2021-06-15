package kr.ac.shms.lms.common.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class LecEvlResVO {
	private Integer lec_evl_no;
	private Integer queitm_no;
	private String stdnt_no;
	private String lec_code;
	private String evl_cont;
}
