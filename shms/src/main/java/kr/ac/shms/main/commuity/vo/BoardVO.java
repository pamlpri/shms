package kr.ac.shms.main.commuity.vo;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import org.springframework.web.multipart.MultipartFile;

import kr.ac.shms.validator.BoardDeleteGroup;
import kr.ac.shms.validator.BoardInsertGroup;
import kr.ac.shms.validator.BoardUpdateGroup;
import kr.ac.shms.validator.DMBoardInsertGroup;
import kr.ac.shms.validator.DMBoardUpdateGroup;
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
 * 2021. 5. 28.      송수미       검증 관련 내용 추가
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(of="bo_no")
@ToString(exclude="bo_cont")
public class BoardVO implements Serializable{
	
	private Integer p_bo_no;	// 페이지 상의 게시글 번호(DB 저장X)
	
	@NotNull(groups= {BoardUpdateGroup.class, BoardDeleteGroup.class}, message="필수 항목")
	@Min(value=1, groups={BoardUpdateGroup.class, BoardDeleteGroup.class})
	private Integer bo_no;		// 게시글 식별 번호
	
	private String bo_kind;		// DG, JG,..(공통코드값)
	
	@NotBlank(groups= {DMBoardInsertGroup.class, DMBoardUpdateGroup.class, BoardInsertGroup.class, BoardUpdateGroup.class}, message="필수 항목")
	private String bo_title;
	
	@NotBlank(groups= {DMBoardInsertGroup.class, DMBoardUpdateGroup.class, BoardInsertGroup.class, BoardUpdateGroup.class}, message="필수 항목")
	private String bo_cont;
	
	@NotBlank(groups= {DMBoardInsertGroup.class}, message="필수 항목")
	private String bo_writer;
	private String bo_write_de;
	
	@NotBlank(groups= {DMBoardInsertGroup.class, DMBoardUpdateGroup.class}, message="필수 항목")
	private String bo_password;
	
	private String bo_secret_at;
	private String bo_ans;
	private Integer bo_hit;
	private String sub_code;
	
	@NotBlank(groups= {DMBoardInsertGroup.class}, message="필수 항목")
	private String univ_inqry_kind;	// PM, HM, JM
	private String lec_code;
	private String ans_writer;
	private String ans_de;
	private Integer atch_file_no;
	private String bo_name;		// 학사공지, 장학공지
	private String inqry_kind_name;	// 편의시설문의, 학사일정문의, 장학금문의
	
	private int startAttNo;
	private List<AttachVO> attachList;
	private MultipartFile[] bo_files;
	public void setBo_files(MultipartFile[] bo_files) {
		System.out.println("bo_files : "+ bo_files.length);
		this.bo_files = bo_files;
		if(bo_files!=null) {
			List<AttachVO> attatchList = new ArrayList<>();
			for(MultipartFile file : bo_files) {
				if(file.isEmpty()) continue;
				attatchList.add(new AttachVO(file));
			}
			if(attatchList.size()>0)
				this.attachList = attatchList;
		}
	}
	private int[] delAttNos;
}
