package kr.ac.shms.lms.student.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author 김보미
 * @since 2021. 6. 14.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일        수정자         수정내용
 * --------     --------    ----------------------
 * 2021. 6. 14.  김보미         최초작성
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class RefundReqVO {
	private Integer req_no;
	private Integer pay_dtls_no;
	private String req_dt;
	private String req_resn;
	private Integer refund_amt;
	private String process_stat;
	private String refuse_resn;
	private String refund_dt;
}
