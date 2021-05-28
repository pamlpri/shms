package kr.ac.shms.lms.student.service;

import java.util.List;

import kr.ac.shms.lms.student.vo.StudentVO;
import kr.ac.shms.lms.student.vo.SugangLecVO;
/**
 * @author 박초원
 * @since 2021. 5. 22.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일          수정자         수정내용
 * --------     --------    ----------------------
 * 2021. 5. 22.   박초원        최초작성
 * 2021. 5. 28.   김보미        수강중인 강의 목록
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
public interface StudentService {
	/**
	 * 한 학생에 대한 정보 추출
	 * @param id
	 * @return 데이터가 없으면 null 반환
	 */
	public StudentVO student(String id);
	
	/**
	 * 학생이 수강중인 강의 목록 정보를 추출
	 * @param stdnt_no 로그인한 학생의 학번
	 * @return 데이터가 없으면 null 반환
	 */
	public List<SugangLecVO> selectSugangList(String stdnt_no);
}
