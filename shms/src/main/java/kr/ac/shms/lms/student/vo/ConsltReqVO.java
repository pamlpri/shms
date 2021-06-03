package kr.ac.shms.lms.student.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ConsltReqVO {
	private String conslt_link;
	private Integer req_no;
	private String consult_cl;
	private String req_date;
	private String hope_date;
	private String req_cont;
	private String process_stat;
	private String stdnt_no;
	private String refuse_resn;
	private String staff_no;
}
