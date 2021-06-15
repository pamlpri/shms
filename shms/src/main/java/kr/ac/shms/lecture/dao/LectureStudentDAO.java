package kr.ac.shms.lecture.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import kr.ac.shms.common.vo.AttachVO;
import kr.ac.shms.lecture.vo.SetTaskVO;
import kr.ac.shms.lecture.vo.TaskSubmitVO;
import kr.ac.shms.lms.student.vo.AttendVO;
import kr.ac.shms.lms.student.vo.LectureVO;
import kr.ac.shms.lms.student.vo.StudentVO;

/**
 * @author 박초원
 * @since 2021. 5. 24.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                  수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 5. 24.      박초원      	       최초작성
 * 2021. 6. 14. 	 박초원				전체 강의 주/회차별 조회
 * 2021. 6. 15.      박초원			    비대면 강의 진도율, 출석
 * 2021. 6. 15. 	 송수미	      학생 과제 목록 조회, 과제 등록, 수정
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */

@Repository
public interface LectureStudentDAO {
	/**
	 * 한 학생에 대한 정보 추출
	 * @param id
	 * @return 데이터가 없으면 null 반환
	 */
	public StudentVO student(String id);
	
	/**
	 * 전체 강의 주/회차별 조회
	 * @param lectureVO
	 * @return 데이터가 없으면 null 반환
	 */
	public List<LectureVO> selectStudentWeeksList(LectureVO lecture);
	
	/**
	 * 한 회차에 대한 세부정보 조회
	 * @param LectureVO
	 * @return 데이터가 없으면 null 반환
	 */
	public LectureVO selectStudentWeekDetail(LectureVO lecture);
	
	/**
	 * 비대면 강의 진도율 등록
	 * @param LectureVO
	 * @return cnt
	 */
	public int insertLectureWeek(LectureVO lecture);
	
	/**
	 * 비대면 강의 진도율 100%라면 출석
	 * @param AttendVO
	 * @return cnt
	 */
	public int insertLectureWeekAttend(AttendVO attend);
	
	/**
	 * 학생이 제출해야 하는 과제 목록 조회
	 * @param search lec_code, stdnt_no
	 * @return 데이터가 없으면 null 반환
	 */
	public List<SetTaskVO> selectTaskList(Map<String, String> search);
	
	/**
	 * 과제 제출
	 * @param taskSubmit
	 * @return row count > 0 : 성공
	 */
	public int insertTask(TaskSubmitVO taskSubmit);
	
	/**
	 * 첨부파일 등록
	 * @param taskSubmit
	 * @return row count > 0 성공
	 */
	public int insertAttaches(TaskSubmitVO taskSubmit);
	
	/**
	 * 하나의 과제 상세 조회
	 * @param search
	 * @return 데이터가 없으면 null 반환
	 */
	public SetTaskVO selectSetTask(Map<String, Object> search);
	
	/**
	 * 하나의 첨부파일 출력
	 * @param attachVO
	 * @return 데이터가 없으면 null 반환
	 */
	public AttachVO selectAttatch(AttachVO attachVO);
}
