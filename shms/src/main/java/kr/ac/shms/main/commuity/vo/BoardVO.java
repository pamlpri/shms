package kr.ac.shms.main.commuity.vo;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

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
	
}
