package kr.ac.shms.common.vo;

import java.util.Map;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import kr.ac.shms.validator.CurriculumInsertGroup;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

/**
 * @author 송수미
 * @since 2021. 6. 23.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 6. 23.      송수미       최초작성
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(of="cur_code")
public class CurriculumVO {
	private String cur_code;
	@NotBlank(groups= {CurriculumInsertGroup.class})
	private String lec_name;
	@NotBlank(groups= {CurriculumInsertGroup.class})
	private String lec_cl;
	private String lec_cl_nm;
	
	@NotNull(groups= {CurriculumInsertGroup.class})
	private Integer lec_pnt;
	@NotNull(groups= {CurriculumInsertGroup.class})
	private Integer lec_cpacity;
	private Integer lec_atnlc;
	@NotNull(groups= {CurriculumInsertGroup.class})
	private Integer estbl_year;
	private Integer posbl_semstr;
	@NotBlank(groups= {CurriculumInsertGroup.class})
	private String sub_code;
	private String lec_del_at;
	@NotBlank(groups= {CurriculumInsertGroup.class})
	private String staff_no;
	private String name;	// 강사명
	private Integer year;
	private Integer semstr;
	
	Map<String, Object> searchMap;
}	
