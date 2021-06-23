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
	private Double mid_scre;
	private Double final_scre;
	private Double attend_scre;
	private Double task_scre;
	private Double etc_scre;
	private String lec_code;
	private Integer rank;
	private Integer stdnt_cnt;
	private Double stdnt_svg;
	
	private String name;
	private String sub_name;
	private String scre_type;
	
	private List<GradeVO> gradeList;
}