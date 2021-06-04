package kr.ac.shms.lms.student.vo;

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
 * 수정일        수정자          수정내용
 * --------     --------    ----------------------
 * 2021. 5. 28.  김보미          최초작성
 * 2021. 6. 4.   최희수     	  시간표 출력
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */

@Data
@AllArgsConstructor
@NoArgsConstructor
public class SugangLecSTVO {
	private String lec_code;
	private String stdnt_no;
	private Integer grade;
	private String stdnt_name;
	private String prof_name;
	private String lec_name; 
	private String lec_cl;
	private Integer semstr;
	private Integer estbl_semstr;
	private String lecrum;
	private String com_code_nm;
	private Integer lec_pnt;
	private Integer total_lec_time;	// 총 강의시간 = 학점 * 60
	private String req_dt;
	private Integer req_semstr;
	private String sugang_at;
	private Integer req_year;

}



