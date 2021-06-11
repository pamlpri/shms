package kr.ac.shms.common.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class LecScoreVO {
	private String pnt_rank_nm;
	private Integer scre_no;
	private Integer grade;
	private Integer semstr;
	private Integer year;
	private String stdnt_no;
	private Integer mid_scre;
	private Integer final_scre;
	private Integer attend_scre;
	private Integer task_scre;
	private Integer etc_scre;
	private String lec_code;
}
