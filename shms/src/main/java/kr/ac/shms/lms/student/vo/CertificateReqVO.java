package kr.ac.shms.lms.student.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

/**
 * @author 김보미
 * @since 2021. 6. 7.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일        수정자       수정내용
 * --------     --------    ----------------------
 * 2021. 6. 7.   김보미       증명서 신청vo
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(of="req_no")
public class CertificateReqVO {
	private Integer p_bo_no;	// 페이지 상의 게시글 번호(DB 저장X)
	
	private Integer crtf_price;
	private Integer no_of_issue;		// 증명서 발급 매수
	private Integer req_no;
	private String stdnt_no;
	private String req_de;
	private String crtf_req_resn;
	private String crtf_kind;
}
