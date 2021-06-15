package kr.ac.shms.lecture.vo;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
/**
 * @author 박초원
 * @since 2021. 6. 15.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일            수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 6. 15.      박초원          최초작성
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */

@Data
@NoArgsConstructor
@EqualsAndHashCode(of= "ques_no")
public class QuesVO {
	private Integer exam_no;
	private Integer ques_no;
	private String ques_type;
	private String ques_ans;
	private Integer ques_allot;
	
	public QuesVO(QuesVO quesVO) {
		super();
		this.exam_no = quesVO.getQues_no();
	}
}
