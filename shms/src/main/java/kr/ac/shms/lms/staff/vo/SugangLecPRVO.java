package kr.ac.shms.lms.staff.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class SugangLecPRVO {
	private String name;
	private String staff_no;
	private String lec_name;
	private Integer lec_pnt;
	private Integer lec_atnlc;
	private String lec_cl;
	private String lec_code;
	private String lecrum;
	private Integer estbl_year;
	
}
