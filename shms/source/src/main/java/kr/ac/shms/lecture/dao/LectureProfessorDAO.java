package kr.ac.shms.lecture.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import kr.ac.shms.common.vo.StaffVO;
import kr.ac.shms.lecture.vo.LectureDetailsVO;
import kr.ac.shms.lecture.vo.SetTaskVO;

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
	public List<LectureDetailsVO> selectTodayLecList(String id);
}
