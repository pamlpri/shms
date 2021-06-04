package kr.ac.shms.lms.student.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

/**
 * @author 작성자명
 * @since 2021. 6. 4.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 6. 4.      최희수       최초작성
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(of="lec_code")
public class LectureVO {
	private String lec_code;
	private String cur_code;
	private String lec_cl;
	private Integer estbl_year;
	private Integer estbl_semstr;
	private String summary;
	private String tchmtr;
	private String adi_tchmtr;
	private String tchmtr_scope;
	private String lec_rm;
	private String dayotw;
	private Integer lec_time;
	private String abolec;
	private Integer atch_file_no;
}
