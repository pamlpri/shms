package kr.ac.shms.lecture.service;

import java.util.List;
import java.util.Map;

import kr.ac.shms.common.enumpkg.ServiceResult;
import kr.ac.shms.common.vo.StaffVO;
import kr.ac.shms.lecture.vo.ExamVO;
import kr.ac.shms.lecture.vo.SetTaskVO;
import kr.ac.shms.lecture.vo.TaskSubmitVO;
import kr.ac.shms.lms.student.vo.LectureVO;
import kr.ac.shms.lms.student.vo.SugangVO;

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
 * 2021. 06. 01.     송수미      	       교수 과제 조회
 * 2021. 06. 08.     송수미      	       교수 강의 개설
 * 2021. 06. 12.     박초원				 주/회차 등록
 * 2021. 06. 14.     송수미              과제 등록, 조회, 수정
 * 2021. 06. 14.	  박초원			 주/회차 조회, 수정
 * 2021. 06. 15.	  박초원			 주/회차 삭제
 * 2021. 06. 15.      박초원 			 교수 시험,문제 출제
 * 2021. 06. 16.      송수미 			 교수 - 학생이 제출한 과제 성적 입력
 * 2021. 06. 16.      박초원			 교수 시험,문제 조회
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */

public interface LectureProfessorService {
	
	/**
	 * 교수에 대한 정보 추출
	 * @param id
	 * @return 데이터가 없으면 null 반환
	 */
	public StaffVO staff(String id);
	
	/**
	 * 교수가 강의 중인 강의에 대한 과제 목록 조회
	 * @param id
	 * @return 데이터가 없으면 null 반환
	 */
	public List<SetTaskVO> selectTask(String id);
	
	/**
	 * 교수가 오늘 강의해야 하는 강의 목록 조회
	 * @param id 교수 번호
	 * @return 데이터가 없으면 null 반환
	 */
	public List<LectureVO> selectTodayLecList(String id);
	
	/**
	 * 교수가 개설 가능한 강의 목록 조회
	 * @param id 교수 번호
	 * @return 데이터가 없으면 null 반환
	 */
	public List<LectureVO> selectLecListForOpen(String id);

	/**
	 * 강의 개설을 위해 강의의 기본 정보를 조회
	 * @param lec_code 강의 코드
	 * @return 데이터가 없으면 null 반환
	 */
	public SugangVO selectLecForOpen(String lec_code);
	
	/**
	 * 강의 개설
	 * @param lecture
	 * @return OK, FAIL
	 */
	public ServiceResult insertLecture(SugangVO lecture);
	
	/**
	 * 강의 정보 변경
	 * @param lecture
	 * @return OK, FAIL
	 */
	public ServiceResult updateLecture(SugangVO lecture);
	
	/**
	 * 교수 주/회차 등록
	 * @param lectureVO
	 * @return cnt > 0 성공
	 */
	public ServiceResult insertWeeks(LectureVO lecture);
	
	/**
	 * 주/회차 가장 마지막 회차의 번호 조회
	 * @param lec_code
	 * @return int cnt
	 */
	public int selectWeeksMaxWeek(String lec_code);
	
	/**
	 * 교수의 과제 등록
	 * @param setTask
	 * @return 성공, 실패
	 */
	public ServiceResult insertSetTask(SetTaskVO setTask);
	
	/**
	 * 주/회차 조회
	 * @param lectureVO
	 * @return 데이터가 없으면 null 반환
	 */
	public List<LectureVO> selectWeeksList(String lec_code);
	/**
	 * 한 회차에 대한 세부정보 조회
	 * @param lectureVO
	 * @return 데이터가 없으면 null 반환
	 */
	public LectureVO selectWeekDetail(int diary_no);
	
	/**
	 * 한 회차 수정
	 * @param diary_no
	 * @return cnt > 0 성공
	 */
	public ServiceResult updateWeek(LectureVO lecture);
	
	/**
	 * 한 회차 삭제
	 * @param diary_no
	 * @return cnt > 0 성공
	 */
	public ServiceResult deleteWeek(int diary_no);
	
	/**
	 * 출제한 과제 목록 조회
	 * @param lec_code
	 * @return 데이터가 없으면 null 반환
	 */
	public List<SetTaskVO> selectSetTaskList(String lec_code);
	
	/**
	 * 과제 하나의 정보  조회
	 * @param search
	 * @return 데이터가 없으면 null 반환
	 */
	public SetTaskVO selectSetTaskInfo(Map<String, Object> search);
	
	/**
	 * 과제 하나 상세 조회
	 * @param set_task_no
	 * @return 데이터가 없으면 null 반환
	 */
	public SetTaskVO selectSetTask(int set_task_no);

	/**
	 * 과제 수정
	 * @param setTask
	 * @return 존재하지 않는 글, 성공, 실패
	 */
	public ServiceResult updateSetTask(SetTaskVO setTask);
	
	/**
	 * 과제 제출 명단 조회
	 * @param searchMap
	 * @return 데이터가 없으면 null 반환
	 */
	public List<TaskSubmitVO> selectTaskSubmitList(Map<String, Object> searchMap);
	
	/**
	 * 시험 출제
	 * @param examVO
	 * @return cnt
	 */
	public ServiceResult insertExam(ExamVO exam);
	
	/**
	 * 시험 목록 조회
	 * @param examVO
	 * @return 데이터가 없으면 null 반환
	 */
	public List<ExamVO> selectExamList(ExamVO exam);
	
	/**
	 * 하나의 시험 상세 조회
	 * @param examVO
	 * @return 데이터가 없으면 null 반환
	 */
	public ExamVO selectExamDetail(ExamVO exam);
	
	/**
	 * 학생이 제출한 과제 성적 입력
	 * @param taskSubmit
	 * @return 성공, 실패
	 */
	public ServiceResult updateTaskScore(TaskSubmitVO taskSubmit);
}
