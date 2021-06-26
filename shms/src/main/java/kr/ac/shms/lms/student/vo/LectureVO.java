package kr.ac.shms.lms.student.vo;

import java.util.ArrayList;
import java.util.List;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import org.springframework.web.multipart.MultipartFile;

import kr.ac.shms.common.vo.AttachVO;
import kr.ac.shms.common.vo.IAttachVO;
import kr.ac.shms.validator.LectureInsertGroup;
import kr.ac.shms.validator.LectureRegisterGroup;
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
public class LectureVO implements IAttachVO {
	private String lec_code;
	private String lec_name;
	@NotBlank(groups= {LectureRegisterGroup.class})
	private String cur_code;
	@NotBlank(groups= {LectureRegisterGroup.class})
	private String lec_cl;
	private String lec_cl_nm;
	@NotNull(groups= {LectureRegisterGroup.class})
	private Integer estbl_year;
	@NotNull(groups= {LectureRegisterGroup.class})
	private Integer estbl_semstr;
	
	@NotBlank(groups={LectureInsertGroup.class})
	private String summary;
	@NotBlank(groups={LectureInsertGroup.class})
	private String tchmtr;
	private String adi_tchmtr;
	private String tchmtr_scope;
	private String name;	// 교수 명
	
	private String lec_rm;
	@NotBlank(groups= {LectureRegisterGroup.class})
	private String dayotw;
	private String dayotw_nm;
	@NotNull(groups= {LectureRegisterGroup.class})
	private Integer lec_time;
	private String lec_full_time;
	private String abolec;
	private Integer atch_file_no;
	private Integer midterm;
	private Integer finals;
	private Integer attend;
	private Integer task;
	private Integer etc;
	private Integer lec_week;
	private String diary_title;
	private String diary_cont;
	private String week_bgnde;
	private String week_endde;
	private String staff_no;
	
	private Integer diary_no;
	private String week_lec_cl;
	private String week_lec_cl_nm;
	private String ut_lec_link;
	private String rt_lec_link;
	private String week_bgnde_char;
	private String week_endde_char;
	
	private Integer sugang_no;
	private String stdnt_no;
	private String sugang_de;
	private Integer sugang_req;
	private Integer sugang_len;
	private String sugang_stat;
	private String bo_writer;
	private String biz_type;
	
	private Integer lec_pnt;
	private String sub_code;
	private String sub_name;
	private Integer lec_atnlc;
	private Integer lec_cpacity; 
	private String lecrum;
	/** lecrum_ttable */
	private Integer lecrum_ttble_no;
	@NotNull(groups= {LectureRegisterGroup.class})
	private Integer lecrum_no;
	
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
