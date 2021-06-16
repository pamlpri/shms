package kr.ac.shms.lecture.vo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import kr.ac.shms.common.vo.AttachVO;
import kr.ac.shms.lms.student.vo.StudentVO;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

/**
 * @author 박초원
 * @since 2021. 6. 15.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일            수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 6. 15.      박초원          최초작성
 * 2021. 6. 16.      송수미          학생 데이터 처리를 위한 수정
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */

@Data
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(of= "exam_no")
public class ExamVO {
	private Integer exam_no;
	private String test_cl;
	private String lec_code;
	private String exam_begin_dt;
	private String exam_end_dt;
	private String online_at;
	private String exam_type;
	private Integer ques_cnt;
	private Integer atch_file_no;
	
	private String test_nm;
	private String test_stat;
	private Integer stdnt_cnt;
	private Integer exam_cnt;

	private Integer gg_cnt;
	private Integer dd_cnt;
	private Integer ss_cnt;
	private Integer gg_sum;
	private Integer dd_sum;
	private Integer ss_sum;
	private Integer ques_sum;
	private Integer exam_time;
	private String stdnt_no;
	private String applcn_at;
	private Integer applcn_no;
	
	private String exam_begin_dt_char;
	private String exam_end_dt_char;
	
	private String sub_name;
	private String name;
	private Integer res_score;
	
	private List<QuesVO> quesList;
	private List<StudentVO> stdntList;	// 시험 응시하는 학생 명단
	
	private int startAttNo;
	private List<AttachVO> attachList;
	private MultipartFile[] exam_files;
	public void setExam_files(MultipartFile[] exam_files) {
		this.exam_files = exam_files;
		if(exam_files != null) {
			List<AttachVO> attachList = new ArrayList<>();
			for(MultipartFile file : exam_files) {
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
