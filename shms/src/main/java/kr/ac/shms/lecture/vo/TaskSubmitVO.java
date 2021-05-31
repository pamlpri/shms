package kr.ac.shms.lecture.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class TaskSubmitVO {
	private Integer p_bo_no;	// 페이지 상의 게시글 번호(DB 저장X)
	private Integer submit_no;
	private Integer set_task_no;
	private String title;
	private String cont;
	private String writer;
	private String submit_dt;
	private Integer task_score;
	private Integer atch_file_no;
}
