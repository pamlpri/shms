package kr.ac.shms.lecture.vo;

import java.util.ArrayList;
import java.util.List;

import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import org.springframework.web.multipart.MultipartFile;

import kr.ac.shms.common.vo.AttachVO;
import kr.ac.shms.validator.SetTaskInsertGroup;
import kr.ac.shms.validator.SetTaskUpdateGroup;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

/**
 * @author 송수미
 * @since 2021. 5. 31.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 5. 31.      송수미       최초작성
 * 2021. 6. 12.      송수미       과제 출제 기능 validate 설정
 * 2021. 6. 14.      송수미       과제 조회
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(of="set_task_no")
public class SetTaskVO {
	private Integer p_bo_no;	// 페이지 상의 번호(DB 저장X)
	
	@NotNull(groups= {SetTaskUpdateGroup.class})
	@Min(value=1, groups= {SetTaskUpdateGroup.class})
	private Integer set_task_no;
	private String lec_code;
	private String task_reg_de;
	private String submit_bgnde;
	private String submit_endde;
	private String process_at;	// 진행 상황
	
	@NotBlank(groups= {SetTaskInsertGroup.class, SetTaskUpdateGroup.class})
	private String task_title;
	private String task_cont;
	@NotNull(groups= {SetTaskInsertGroup.class, SetTaskUpdateGroup.class})
	private Integer task_allot;
	private Integer atch_file_no;
	
	private List<TaskSubmitVO> taskSubmitList;
	private String submit_at;	// 학생이 과제 정보 출력할 때 제출 여부
	private Integer grade_cnt;	// 채점한 과제 수 
	private Integer submit_cnt;	// 과제 제출한 학생 수
	private Integer total_cnt;	// 내 강의 듣는 수강생 수
	
	private int startAttNo;
	private List<AttachVO> attachList;
	private MultipartFile[] set_task_files;
	public void setSet_task_files(MultipartFile[] set_task_files) {
		System.out.println("set_task_files : "+ set_task_files.length);
		this.set_task_files = set_task_files;
		if(set_task_files!=null) {
			List<AttachVO> attatchList = new ArrayList<>();
			for(MultipartFile file : set_task_files) {
				if(file.isEmpty()) continue;
				attatchList.add(new AttachVO(file));
			}
			if(attatchList.size()>0)
				this.attachList = attatchList;
		}
	}
	private int[] delAttNos;
	
	private List<TaskSubmitVO> submitList;
	
}
