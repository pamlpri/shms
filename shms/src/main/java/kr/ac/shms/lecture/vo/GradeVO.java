package kr.ac.shms.lecture.vo;

import java.io.Serializable;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

/**
 * @author 박초원
 * @since 2021. 6. 23.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                  수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 6. 23.      박초원      	       최초작성
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(of= "scre_no")
public class GradeVO implements Serializable{
	private Integer scre_no;
	private String pnt_rank_nm;
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
	
	private String name;
	private String sub_name;
	
	private List<GradeVO> gradeList;
}