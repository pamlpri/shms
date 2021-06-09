package kr.ac.shms.lms.student.vo;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import kr.ac.shms.validator.CertificateInsertGroup;
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
 * 2021. 6. 9.   김보미		  vo 추가
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(of="req_no")
public class CertificateReqVO {
	private Integer p_bo_no;	// 페이지 상의 게시글 번호(DB 저장X)
	
	@NotBlank(groups= {CertificateInsertGroup.class}, message="필수항목")
	private Integer crtf_price;
	@NotBlank(groups= {CertificateInsertGroup.class}, message="필수항목")
	private Integer no_of_issue;		// 증명서 발급 매수
	@NotNull(groups= {CertificateInsertGroup.class}, message="필수항목")
	private Integer req_no;
	@NotNull(groups= {CertificateInsertGroup.class}, message="필수항목")
	private String stdnt_no;
	@NotNull(groups= {CertificateInsertGroup.class}, message="필수항목")
	private String req_de;
	@NotNull(groups= {CertificateInsertGroup.class}, message="필수항목")
	private String crtf_req_resn;
	@NotNull(groups= {CertificateInsertGroup.class}, message="필수항목")
	private String crtf_kind;
	private Integer issued_cnt;
	
	private String sub_name;	// 학과 이름
	
	private String regno; 	// 생년월일
	private String col_name;	// 대학이름
	private Integer grade;		// 학년
	private String entsch_de;	// 입학일자
	private String grdtn_de;	// 졸업일자
	private String reginfo_stat;	// 학적상태
	private String name;		// 이름
	private String end_de;		// 만료일
	private Integer year;		// 년도 추출
	
	private Integer req_year;	// 신청년도추출
	private Integer req_month;		// 신청달추출
	private Integer req_day;		// 신청날짜추출
	
	private String cng_bgnde;		// 휴학시작일
	private String cng_endde;		// 휴학종료일
	
}
