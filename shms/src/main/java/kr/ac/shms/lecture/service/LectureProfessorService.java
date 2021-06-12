package kr.ac.shms.lecture.service;

import java.util.List;

import kr.ac.shms.common.enumpkg.ServiceResult;
import kr.ac.shms.common.vo.StaffVO;
import kr.ac.shms.lecture.vo.SetTaskVO;
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
}
