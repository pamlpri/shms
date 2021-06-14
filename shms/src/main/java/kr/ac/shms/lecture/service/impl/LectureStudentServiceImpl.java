package kr.ac.shms.lecture.service.impl;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.ac.shms.lecture.dao.LectureStudentDAO;
import kr.ac.shms.lecture.service.LectureStudentService;
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
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */

@Service
public class LectureStudentServiceImpl implements LectureStudentService {
	@Inject
	private LectureStudentDAO lectureStudentDAO;
	
	@Override
	public StudentVO student(String id) {
		return lectureStudentDAO.student(id);
	}
}
