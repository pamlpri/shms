package kr.ac.shms.lecture.service;

import java.util.List;
import java.util.Map;

import kr.ac.shms.common.enumpkg.ServiceResult;
import kr.ac.shms.lecture.vo.ExamVO;
import kr.ac.shms.lecture.vo.GradeVO;
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
 * 2021. 6. 15.      박초원			    비대면 강의 진도율
 * 2021. 6. 15. 	 송수미	      학생 과제 목록 조회, 과제 등록, 수정
 * 2021. 6. 17. 	 송수미	      시험 정보 조회, 시험 응시
 * 2021. 6. 18.      김보미   QR 출석 관련 이동
 * 2021. 6. 23.      박초원		강의사이트 성적관리
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */

public interface LectureStudentService {
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
	 * @param diary_no
	 * @return 데이터가 없으면 null 반환
	 */
	public LectureVO selectStudentWeekDetail(LectureVO lecture);
	
	/**
	 * 비대면 강의 진도율 등록
	 * @param LectureVO
	 * @return cnt
	 */
	public ServiceResult insertLectureWeek(LectureVO lecture);
	
	/**
	 * 비대면 강의 진도율 100%라면 출석
	 * @param AttendVO
	 * @return cnt
	 */
	public ServiceResult insertLectureWeekAttend(AttendVO attend);
	
	/**
	 * 학생이 제출해야 하는 과제 목록 조회
	 * @param search lec_code, stdnt_no
	 * @return 데이터가 없으면 null 반환
	 */
	public List<SetTaskVO> selectTaskList(Map<String, String> search);
	
	/**
	 * 과제 제출
	 * @param taskSubmit
	 * @return 성공, 실패
	 */
	public ServiceResult insertTask(TaskSubmitVO taskSubmit);
	
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
	 * @return 성공, 실패
	 */
	public ServiceResult updateTask(TaskSubmitVO taskSubmit);
	
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
	 * 데이터 계산을 위해 정보 추출
	 * @param studentInfo 학번, 강의코드
	 * @return attendVO
	 */
	public AttendVO selectAttendInfo(AttendVO studentInfo);
	
	/**
	 * 입실시간, 퇴실시간 추출
	 * @param attendVO 학번, 강의 코드
	 * @return 입실시간
	 */
	public AttendVO selectAtndanTime(AttendVO attendVO);
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
	public ServiceResult attend(AttendVO attendInfo);
	
	/**
	 * 출석(퇴실)정보를 update
	 * @param exitInfo 학번, 강의코드
	 * @return ServiceResult
	 */
	public ServiceResult exit(AttendVO exitInfo);
    
    /**
     * 입실 카운트
     * @param attendVO
     * @return
     */
    public ServiceResult selectCountAttend(AttendVO attendVO);
    
    /**
     * 퇴실 카운트
     * @param attendVO
     * @return
     */
    public ServiceResult selectCountExit(AttendVO attendVO);

    /**
     * 출석상태 업데이트 
     * @param attendVO
     * @return 
     */
    public ServiceResult updateAttendStat(AttendVO attendVO);
    
    /**
     * 학생의 시험 응시 정보를 insert
     * @param takeExam
     * @return 성공, 실패
     */
    public ServiceResult insertTakeExam(TakeExamVO takeExam);
    
    /**
     * 한 학생에 대한 중간고사 성적 조회
     * @param GradeVO
     * @return 데이터가 없으면 null 반환
     */
    public GradeVO selectMidScore(GradeVO grade);
    
    /**
     * 한 학생에 대한 기말고사 성적 조회
     * @param GradeVO
     * @return 데이터가 없으면 null 반환
     */
    public GradeVO selectFinalScore(GradeVO grade);
    
    /**
     * 한 학생에 대한 출석 성적 조회
     * @param GradeVO
     * @return 데이터가 없으면 null 반환
     */
    public GradeVO selectAttendScore(GradeVO grade);
    
    /**
     * 한 학생에 대한 과제 성적 조회
     * @param GradeVO
     * @return 데이터가 없으면 null 반환
     */
    public GradeVO selectTaskScore(GradeVO grade);
}
