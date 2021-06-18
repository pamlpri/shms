package kr.ac.shms.lecture.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import kr.ac.shms.lecture.vo.ExamVO;
import kr.ac.shms.lecture.vo.QuesVO;
import kr.ac.shms.lecture.vo.SetTaskVO;
import kr.ac.shms.lecture.vo.TakeExamVO;
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
 * 2021. 6. 17. 	 송수미	      시험 정보 조회
 * 2021. 6. 18.      김보미    출석 관련 이동
 * 2021. 6. 17. 	 송수미	      시험 응시
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
	 * 하나의 과제 상세 조회
	 * @param search
	 * @return 데이터가 없으면 null 반환
	 */
	public SetTaskVO selectSetTask(Map<String, Object> search);
	
	/**
	 * 학생이 제출한 과제 조회
	 * @param submit_no
	 * @return 데이터가 없으면 null 반환
	 */
	public TaskSubmitVO selectTaskSubmit(int submit_no);
	
	/**
	 * 과제 수정
	 * @param taskSubmit
	 * @return row count > 0 : 성공
	 */
	public int updateTask(TaskSubmitVO taskSubmit);
	
	/**
	 * 한 강의에 등록되어 있는 시험 정보 조회
	 * @param search
	 * @return 데이터가 없으면 null 반환
	 */
	public List<ExamVO> selectExamList(Map<String, String> search);
	
	/**
	 * 한 시험에 대한 상세 정보 조회
	 * @param exam_no
	 * @return 데이터가 없으면 null 반환
	 */
	public ExamVO selectExamInfo(int exam_no);
	
	/**
	 * 한 시험 정답 정보
	 * @param exam_no
	 * @return 데이터가 없으면 null 반환
	 */
	public List<QuesVO> selectExamQues(int exam_no);
	
	/**
	 * 입실시간 추출
	 * @param attendVO 학번, 강의 코드
	 * @return 입실시간
	 */
	public AttendVO selectAtndanTime(AttendVO attendVO);
	
	/**
	 * 데이터 계산을 위해 정보 추출
	 * @param studentInfo 학번, 강의코드
	 * @return attendVO
	 */
	public AttendVO selectAttendInfo(AttendVO studentInfo);
	/**
	 * qr코드에 넣을 정보 추출
	 * @param attendInfo 학번, 강의코드
	 * @return 학번, 강의코드
	 */
	public AttendVO selectQRInfo(AttendVO attendInfo);
	
	/**
	 * 출석(입실)정보를 insert
	 * @param attendInfo 학번, 강의코드
	 * @return ServiceResult 
	 */
	public int attend(AttendVO attendInfo);
	
	/**
	 * 출석(퇴실)정보를 update
	 * @param exitInfo 학번, 강의코드
	 * @return ServiceResult
	 */
	public int exit(AttendVO exitInfo);
	
    /**
     * 입실 카운트
     * @param attendVO
     * @return
     */
    public int selectCountAttend(AttendVO attendVO);
    
    /**
     * 퇴실 카운트
     * @param attendVO
     * @return 
     */
    public int selectCountExit(AttendVO attendVO);
    
    /**
     * 출석상태 업데이트 
     * @param attendVO
     * @return row count > 0 : 성공
     */
    public int updateAttendStat(AttendVO attendVO);
    
    /**
     * 시험 응시 정보 등록
     * @param takeExam
     * @return row count > 0 : 성공
     */
    public int insertTakeExam(TakeExamVO takeExam);
    
    /**
     * 시험 응시 문제 정보 등록
     * @param takeExam
     * @return row count > 0 : 성공
     */
    public int insertTakeExamDtls(TakeExamVO takeExam);
    
    /**
     * 시험 점수 등록
     * @param score
     * @return row count > 0 : 성공
     */
    public int updateTakeExamScore(int score);
}
