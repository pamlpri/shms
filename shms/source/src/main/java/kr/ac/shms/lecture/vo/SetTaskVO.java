package kr.ac.shms.lecture.vo;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

/**
 * @author 송수미
 * @since 2021. 5. 31.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 5. 31.      송수미       최초작성
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(of="set_task_no")
public class SetTaskVO {
	private Integer p_bo_no;	// 페이지 상의 번호(DB 저장X)
	
	private Integer set_task_no;
	private String lec_code;
	private String task_reg_de;
	private String submit_bgnde;
	private String submit_endde;
	private String task_title;
	private String task_cont;
	private Integer task_allot;
	private Integer atch_file_no;
	private List<TaskSubmitVO> taskSubmitList;
	private String submit_at;	// 학생이 과제 정보 출력할 때 제출 여부
	
	private Integer submit_cnt;	// 과제 제출한 학생 수
	private Integer total_cnt;	// 내 강의 듣는 수강생 수
}
