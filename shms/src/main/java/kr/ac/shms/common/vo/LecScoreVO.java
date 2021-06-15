package kr.ac.shms.common.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(of="stdnt_no")
public class LecScoreVO {
	private Integer scre_no;
	private String stdnt_no;
	private String Lec_code;
	private String lec_name;
	private String name;
	private String lec_cl_nm;
	private Integer lec_pnt;
	private Double total;
	private String pnt_rank_nm;
	private Integer year;
	private Integer semstr;
	
	
	// 학기, 평균, 평점
	private Integer totalCredit;
	private double totalPntVal;
	private double totalAvg;
	
	// 강의평가
	private String com_code_nm;
	private String cur_code;
	
	// 강의 평가 상태
	private String status;
}
