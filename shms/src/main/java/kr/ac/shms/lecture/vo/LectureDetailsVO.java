package kr.ac.shms.lecture.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author 김보미
 * @since 2021. 5. 28.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일         수정자       수정내용
 * --------     --------    ----------------------
 * 2021. 5. 28.   김보미      최초작성
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class LectureDetailsVO {
	public String lec_code;
	public String lec_name;
	public String summary;
	public Integer midterm;
	public Integer finals;
	public Integer attend;
	public Integer task;
	public Integer etc;
	public Integer lec_week;
	public String diary_title;
	public String diary_cont;
	public String week_bgnde;
	public String week_dndde;
}
