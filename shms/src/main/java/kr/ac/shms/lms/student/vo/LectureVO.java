package kr.ac.shms.lms.student.vo;

import java.util.ArrayList;
import java.util.List;

import javax.validation.constraints.NotBlank;

import org.springframework.web.multipart.MultipartFile;

import kr.ac.shms.common.vo.AttachVO;
import kr.ac.shms.validator.LectureInsertGroup;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

/**
 * @author 작성자명
 * @since 2021. 6. 4.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 6. 4.      최희수       최초작성
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(of="lec_code")
public class LectureVO {
	private String lec_code;
	private String lec_name;
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
	private String lec_full_time;
	private String abolec;
	private Integer atch_file_no;
	public Integer midterm;
	public Integer finals;
	public Integer attend;
	public Integer task;
	public Integer etc;
	public Integer lec_week;
	public String diary_title;
	public String diary_cont;
	public String week_bgnde;
	public String week_endde;
	public String staff_no;
	
	private Integer diary_no;
	private String week_lec_cl;
	private String ut_lec_link;
	private String rt_lec_link;
	private String week_bgnde_char;
	private String week_endde_char;
	
	private Integer sugang_no;
	private String stdnt_no;
	private String sugang_de;
	private Integer sugang_req;
	
	private int startAttNo;
	private List<AttachVO> attachList;
	private MultipartFile[] lecture_files;
	public void setLecture_files(MultipartFile[] lecture_files) {
		this.lecture_files = lecture_files;
		if(lecture_files != null) {
			List<AttachVO> attachList = new ArrayList<>();
			for(MultipartFile file : lecture_files) {
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
