package kr.ac.shms.lecture.service;

import java.util.List;

import kr.ac.shms.common.enumpkg.ServiceResult;
import kr.ac.shms.lecture.vo.SetTaskVO;
import kr.ac.shms.lms.student.vo.LectureVO;
import kr.ac.shms.lms.student.vo.SugangLecSTVO;

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
 * 2021. 5. 29.   김보미         교수 강의 목록 
 * 2021. 5. 31.   송수미         학생 과제, 강의 정보 출력 기능 구현
 * 2021. 6. 02.   김보미         수강 완료 강의 목록 출력
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
public interface LectureService {
	/**
	 * 학생이 수강중인 강의 목록 정보를 추출
	 * @param stdnt_no 로그인한 학생의 학번
	 * @return 데이터가 없으면 null 반환
	 */
	public List<SugangLecSTVO> selectStudentSugangList(String stdnt_no);
	
	/**
	 * 강의 하나에 대한 정보를 추출
	 * @param lec_code 강의코드
	 * @return 
	 */
	public LectureVO selectLectureDetails(String lec_code);
	
	/**
	 * 교수가 관리하는 강의 목록 추출
	 * @param staff_no
	 * @return 데이터가 없으면 null 반환
	 */
	public List<SugangLecSTVO> selectProfessorSugangList(String staff_no);
	
	/**
	 * 한 학생이 수행해야 하는 과제 정보 추출
	 * @param id
	 * @return 데이터가 없으면 null 반환
	 */
	public List<SetTaskVO> selectTask(String id);

	/**
	 * 오늘 수강/강의해야 하는 강의의 시간 및 강의명을 조회
	 * @param id 학생 번호, 교수 번호
	 * @return 데이터가 없으면 null 반환
	 */
	public List<LectureVO> selectTodayLecList(String id);
	
	/**
	 * 수강 완료된 강의 목록 출력
	 * @param stdnt_no 학생의 학번
	 * @return 데이터가 없으면 null 반환
	 */
	public List<SugangLecSTVO> selectCompleteSugangList(String stdnt_no);

}
