package kr.ac.shms.lms.student.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ScholarShipVO {
	private Integer req_no;
	private String reciv_date;
	private Integer reciv_amt;
	private String recivAmt;	// 가공한 장학금 수혜금액
	
	private String stdnt_no;
	private String req_de;
	private String req_resn;
	private String process_stat;
	private String papers_submit_at;
	private String refuse_resn;
	private Integer schlship_no;
	private String staff_no;
	
	private Integer reciv_year;		// 수혜년도
	private Integer semstr;		// 학기
	private String schlship_nm;		// 장학금 명
	private Integer rownum;
}
