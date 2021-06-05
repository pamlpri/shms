package kr.ac.shms.common.vo;

import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * @author 박초원
 * @since 2021. 6. 5.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                  수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 6. 5.      박초원      	       최초작성
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Data
@EqualsAndHashCode(of="sub_code")
public class SubjectVO {
	private String sub_index;
	private String fax_no;
	private Integer grdtn_pnt;
	private String staff_no;
	private String sub_code;
	private String sub_name;
	private String col_code;
	private String estbl_de;
	private Integer reg_amt;
	private String offrum_loc;
	private String tel_no;
}
