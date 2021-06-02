package kr.ac.shms.lms.common.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(of="educ_no")
public class CourseEducVO {
	private Integer p_bo_no;
	
	private Integer educ_no;
	private String educ_title;
	private String educ_cont;
	
	private String instrctr_nm;
	private String instrctr_com;
	private Integer lecrum_no;
	private String lecrum_info;
	private Integer educ_nmpr;
	private Integer educ_target;
	
	private String educ_reg_date;
	private String educ_bgnde;
	private String educ_endde;
	private String educ_date;
	private String educ_time;
}
