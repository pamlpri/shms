package kr.ac.shms.lms.student.vo;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import org.springframework.web.multipart.MultipartFile;

import kr.ac.shms.common.vo.AttachVO;
import kr.ac.shms.common.vo.IAttachVO;
import kr.ac.shms.validator.LectureInsertGroup;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

/**
 * @author 박초원
 * @since 2021. 6. 5.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일           수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 6. 5.      박초원      	       최초작성
 * 2021. 6. 5.      송수미                 필요한 정보 추가
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
 
@Data
@AllArgsConstructor
@NoArgsConstructor 
@EqualsAndHashCode(of="lec_code")
public class SugangVO implements IAttachVO {
//	lecture 테이블
	private String lec_code;
	private String cur_code;
	private String lec_cl;
	private Integer estbl_year;
	private Integer estbl_semstr;
	@NotBlank(groups={LectureInsertGroup.class})
	private String summary;
	@NotBlank(groups={LectureInsertGroup.class})
	private String tchmtr;
	private String adi_tchmtr;
	private String tchmtr_scope;
	private String lec_rm;
	private String dayotw;
	private Integer lec_time;
	private String abolec;
	private Integer atch_file_no;
	
//	curriculum 테이블
	private String lec_name;
	private Integer lec_pnt;
	private Integer lec_cpacity;
	private Integer lec_atnlc;
	private Integer posbl_semstr;
	private String sub_code;
	private String lec_del_at;
	private String staff_no;
	
//	수강신청
	private Integer req_year;
	private Integer req_semstr;
	private String sugang_at;
	private String stdnt_no;
	private String req_dt;
	
	//vo생성
	private String lec_cl_nm;
	private String lecrum;
	private String name;
	private String sub_name;
	private String col_code;
	private String col_name;
	private String lec_end;
	private String lec_sugang;
	private String dayotw_nm;
	private String lec_cl_grp;
	private List<SugangVO> dataList;
	private Map<String, Object> searchMap;
	private Integer cart_cnt;
	
    private String stdnt_name;
    private String stdnt_grade;
    private String sugang_lec_cnt;    // 신청 교과목 수
    private String sugang_at_pnt;    // 신청 학점
    private String lec_able_pnt;    // 수강 가능 학점
	private String lec_full_time;	// 출력 형식 : 9 - 12시
	
	public Integer midterm;
	public Integer finals;
	public Integer attend;
	public Integer task;
	public Integer etc;
	public Integer lec_week;
	public String diary_title;
	public String diary_cont;
	public String week_bgnde;
	public String week_dndde;
	private String bo_writer;
	private String biz_type;
	
	private int startAttNo;
	private List<AttachVO> attachList;
	private MultipartFile[] common_files;
	public void setCommon_files(MultipartFile[] common_files) {
		this.common_files = common_files;
		if(common_files != null) {
			List<AttachVO> attachList = new ArrayList<>();
			for(MultipartFile file : common_files) {
				if(file.isEmpty()) continue;
				attachList.add(new AttachVO(file));
			}
			if(attachList.size() > 0){
				this.attachList = attachList;
			}
		}
	}
	private int[] delAttNos;
}
