package kr.ac.shms.lms.student.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author 김보미
 * @since 2021. 5. 28.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일         수정자         수정내용
 * --------     --------    ----------------------
 * 2021. 5. 28.   김보미         최초작성
 * 2021. 6. 01.   김보미         출석상태를 계산하기 위한 vo 추가
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class AttendVO {
	private Integer atndan_no;
	private String lec_code;
	private String attend_date;		// 출석날짜
	private String attend_time;		// 입실 시간
	private String exit_time;	// 강의 종료시간
	private String attend_stat;
	private String stdnt_no;
	private Integer lec_pnt;
	private Integer tm;
	
	private Integer stdnt_atndan_time; // 학생 출석 시간 = 퇴실시간 - 입실시간(학생이 수업을 들은 시간(분))
	private Integer finish_lec; 	// 강의 종료 시간
	private Integer total_lec_time;	// 총 강의 시간(분)
	private Integer stdnt_attend_time;	// 학생 입실 시간
	private int arr; 	// 수업시작시간 - 학생 입실 시간 
	
	private Integer attend_check;	// 출석인정시간(분)
	private Integer finish_check;	// 퇴실시간-강의종료시간
	private Integer start_check; 	// 강의시작시간-입실시간
	
	
}


















