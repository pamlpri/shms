package kr.ac.shms.main.commuity.vo;

import java.io.Serializable;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

/**
 * @author 송수미
 * @since 2021. 5. 25.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 5. 25.      송수미       최초작성
 * 2021. 5. 27.      송수미       첨부파일 관련 객체 추가
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(of="bo_no")
@ToString(exclude="bo_cont")
public class BoardVO implements Serializable{
	private Integer p_bo_no;	// 페이지 상의 게시글 번호
	private Integer bo_no;		// 게시글 식별 번호
	private String bo_kind;		// DG, JG,..(공통코드값)
	private String bo_title;
	private String bo_cont;
	
	private String bo_writer;
	private String bo_write_de;
	private String bo_password;
	private String bo_secret_at;
	private String bo_ans;
	private Integer bo_hit;
	
	private String sub_code;
	private String univ_inqry_kind;	// PM, HM, JM
	private String lec_code;
	private String file_name;
	private String ans_writer;
	private String ans_de;
	private String bo_name;		// 학사공지, 장학공지
	private String inqry_kind_name;	// 편의시설문의, 학사일정문의, 장학금문의
	private List<AttachVO> attachList;
}
