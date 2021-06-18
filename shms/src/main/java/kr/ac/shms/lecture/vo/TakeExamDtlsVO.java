package kr.ac.shms.lecture.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

/**
 * @author 송수미
 * @since 2021. 6. 18.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 6. 18.      송수미       최초작성
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(of="dtls_no")
public class TakeExamDtlsVO {
	private Integer dtls_no;
	private Integer applcn_no;	// 시험 응시번호
	private Integer exam_no;
	private Integer ques_no;
	private String submit_ans;
	private String ans_at;
}
