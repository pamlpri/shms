package kr.ac.shms.lecture.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import kr.ac.shms.common.vo.IAttachVO;
import kr.ac.shms.common.vo.StaffVO;
import kr.ac.shms.lecture.vo.ExamVO;
import kr.ac.shms.lecture.vo.GradeVO;
import kr.ac.shms.lecture.vo.QuesVO;
import kr.ac.shms.lecture.vo.SetTaskVO;
import kr.ac.shms.lecture.vo.TaskSubmitVO;
import kr.ac.shms.lms.student.vo.AttendVO;
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
 * 2021. 06. 14.  	  송수미        	 과제 등록, 조회, 수정
 * 2021. 06. 14.	  박초원			 주/회차 조회, 수정
 * 2021. 06. 15.	  박초원			 주/회차 삭제
 * 2021. 06. 15.      박초원 			 교수 시험,문제 출제
 * 2021. 06. 16.      송수미 			 교수 학생이 제출한 과제 성적 입력
 * 2021. 06. 16.      박초원			 교수 시험,문제 조회
 * 2021. 06. 17. 	  박초원			 교수 시험,문제 수정
 * 2021. 06. 18.      박초원			 교수 강의 학생 주차별 출석조회
 * 2021. 6. 21.       박초원 		     교수 학생 출석수정, 출석 성적부 반영
 * 2021. 6. 22. 	  박초원			 서술형, 단답형 채점, 성적 수정
 * 2021. 6. 23.		  박초원			 성적관리
 * 2021. 6. 26.      박초원				   과제 성적부 반영
 * 2021. 6. 26.      박초원				 실시간강의 출석체크
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */

@Repository
public interface LectureProfessorDAO {
	
	/**
	 * 교수에 대한 정보 추출
	 * @param id 교수 번호
	 * @return 데이터가 없으면 null 반환
	 */
	public StaffVO staff(String id);
	
	/**
	 * 교수가 강의 중인 강의에 대한 과제 목록 조회
	 * @param id 교수 번호
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
	 * 강의 개설, 강의 정보 변경
	 * @param lecture
	 * @return row count > 0 : 성공
	 */
	public int updateLecture(SugangVO lecture);
	
	/**
	 * 강의에 대한 상세 정보 입력
	 * @param lecture
	 * @return row count > 0 : 성공
	 */
	public int insertLectureDetails(SugangVO lecture);
	/**
	 * 강의 세부 정보 변경
	 * @param lecture
	 * @return row count > 0 : 성공
	 */
	public int updateLectureDetails(SugangVO lecture); 

	/**
	 * 교수 주/회차 등록
	 * @param lectureVO
	 * @return cnt > 0 성공
	 */
	public int insertWeeks(LectureVO lecture);
	
	/**
	 * 주/회차 가장 마지막 회차의 번호 조회
	 * @param lec_code
	 * @return int cnt
	 */
	public int selectWeeksMaxWeek(String lec_code);
	
	/**
	 * 교수의 과제 등록
	 * @param setTask
	 * @return row count > 0 : 성공
	 */
	public int insertSetTask(SetTaskVO setTask);
	
	/**
	 * 주/회차 조회
	 * @param lec_code
	 * @return 데이터가 없으면 null 반환
	 */
	public List<LectureVO> selectWeeksList(String lec_code);
	
	/**
	 * 한 회차에 대한 세부정보 조회
	 * @param diary_no
	 * @return 데이터가 없으면 null 반환
	 */
	public LectureVO selectWeekDetail(int diary_no);
	
	/**
	 * 한 회차 수정
	 * @param diary_no
	 * @return cnt > 0 성공
	 */
	public int updateWeek(LectureVO lecture);
	
	/**
	 * 주/회차 삭제
	 * @param diary_no
	 * @return int cnt
	 */
	public int deleteWeek(int diary_no);
	
	/**
	 * 출제한 과제 목록 조회
	 * @param lec_code
	 * @return 데이터가 없으면 null 반환
	 */
	public List<SetTaskVO> selectSetTaskList(String lec_code);
	
	/**
	 * 과제 하나에 대한 정보 조회
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
	 * @return row count > 0 : 성공
	 */
	public int updateSetTask(SetTaskVO setTask);
	
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
	public int insertExam(ExamVO exam);

	/**
	 * 문제 출제
	 * @param examVO
	 * @return cnt
	 */
	public int insertQues(ExamVO exam);
	
	/**
	 * 시험 목록 조회
	 * @param lec_code
	 * @return 데이터가 없으면 null 반환
	 */
	public List<ExamVO> selectExamList(String lec_code);
	
	/**
	 * 하나의 시험 상세 조회
	 * @param examVO
	 * @return 데이터가 없으면 null 반환
	 */
	public ExamVO selectExamDetail(ExamVO exam);
	
	/**
	 * 하나의 시험을 응시하는 학생에 대한 정보 조회
	 * @param examVO
	 * @return 데이터가 없으면 null 반환
	 */
	public List<ExamVO> selectExamStudentList(ExamVO exam);
	
	/**
	 * 하나의 시험의 답안지 조회
	 * @param exam_no
	 * @return cnt
	 */
	public List<QuesVO> selectQuesList(int exam_no);
	
	/**
	 * 시험 수정
	 * @param examVO
	 * @return cnt
	 */
	public int updateExam(ExamVO exam);
	
	/**
	 * 답안 수정
	 * @param examVO
	 * @return cnt
	 */
	public int updateQues(int exam_no);

	/**
	 * 학생이 제출한 과제 성적 입력
	 * @param taskSubmit
	 * @return row count > 0 : 성공
	 */
	public int updateTaskScore(TaskSubmitVO taskSubmit);
	
	/**
	 * 주차별 수강학생들의 출석현황 조회
	 * @param lec_code
	 * @return 데이터가 없으면 null 반환
	 */
	public List<AttendVO> selectAttendStudentList(String lec_code);
	
	/**
	 * 한 학생에 대한 출석 수정
	 * @para AttendVO
	 * @return cnt
	 */
	public int updateStudentAttend(AttendVO attend);
	
	/**
	 * 출석부 성적 반영
	 * @param attendVO
	 * @return cnt
	 */
	public int insertAttendGrade(AttendVO attend);
	
	/**
	 * 한 학생의 주관식 답안 조회
	 * @param examVO
	 * @return examVO
	 */
	public List<QuesVO> selectStudentOMR(ExamVO exam);
	
	/**
	 * 한 학생의 주관식 정답여부 업데이트
	 * @param examVO
	 * @return cnt
	 */
	public int updateExamGrade(QuesVO ques);
	
	/**
	 * 한 학생의 주관식 채점 후 총점 업데이트
	 * @param examVO
	 * @return cnt
	 */
	public int updateResScore(ExamVO exam);
	
	/**
	 * 한 학생의 총점 수정
	 * @param examVO
	 * @return cnt
	 */
	public int updateAjaxResScore(ExamVO exam);
	
	/**
	 * 학생들의 시험점수 성적부반영
	 * @param examVO
	 * @return cnt
	 */
	public int insertExamGrade(ExamVO exam);
	
	/**
	 * 강의의 학생들의 성적 조회
	 * @param gradeVO
	 * @return 데이터가 없으면 null 반환
	 */
	public List<GradeVO> selectGradeList(String lec_code);	
	
	/**
	 * 강의의 학생들의 모든 성적을 성적부에 반영하고 학점 부여
	 * @param gradeVO
	 * @return cnt
	 */
	public int updateGrade(GradeVO grade);
	
	/**
	 * 강의의 학생들의 모든 성적을 수정
	 * @param gradeVO
	 * @return cnt
	 */
	public int updateGradeForAjax(GradeVO grade);
	
	/**
	 * 첨부파일 없는 게시글 수정할 때 첨부파일 추가 시, 첨부파일 번호 새로 부여
	 * @param board  
	 * @return row count > 0 성공
	 */
	public int updateAtchNo(IAttachVO iattachVO);
	
	/**
	 * 과제 최종 성적부 반영
	 * @param map
	 */
	public void updateReportGrade(Map<String, Object> pMap);	
	
	/**
	 * 실시간 강의 출결체크 리스트 조회
	 * @param AttendVO
	 * @return AttendVO
	 */
	public List<AttendVO> selectLiveAttendList(AttendVO sttend);	
}
