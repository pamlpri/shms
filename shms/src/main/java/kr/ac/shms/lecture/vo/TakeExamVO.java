package kr.ac.shms.lecture.vo;

import java.util.List;

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
@EqualsAndHashCode(of="applcn_no")
public class TakeExamVO {
	private Integer applcn_no;
	private Integer exam_no;
	private String lec_code;
	private String applcn_dt;
	private Integer res_score;
	private String stdnt_no;
	private List<TakeExamDtlsVO> dtlsList;
	private Integer startDtlsNo;
}
