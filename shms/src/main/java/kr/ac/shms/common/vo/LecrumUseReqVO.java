package kr.ac.shms.common.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

/**
 * @author 송수미
 * @since 2021. 6. 1.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 6. 1.      송수미       최초작성
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(of="lecrum_use_no")
public class LecrumUseReqVO {
	private Integer lecrum_use_no;
	private Integer lecrum_no;
	private String use_begin_dt;
	private String use_end_dt;
	private String use_tb_code;
	private Integer use_tb_no;
	private String process_stat;
	private String req_resn;
}
