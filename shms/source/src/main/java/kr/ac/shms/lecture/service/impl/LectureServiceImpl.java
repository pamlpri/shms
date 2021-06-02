package kr.ac.shms.lecture.service.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.ac.shms.lecture.dao.LectureDAO;
import kr.ac.shms.lecture.service.LectureService;
import kr.ac.shms.lecture.vo.LectureDetailsVO;
import kr.ac.shms.lecture.vo.SetTaskVO;
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
 * 2021. 5. 29.   김보미       교수 강의 목록 
 * 2021. 5. 31.   송수미       학생 과제, 강의 목록 
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Service
public class LectureServiceImpl implements LectureService{
	@Inject
	private LectureDAO lectureDAO;

	@Override
	public List<SugangLecSTVO> selectStudentSugangList(String stdnt_no) {
		return lectureDAO.selectStudentSugangList(stdnt_no);
	}

	@Override
	public List<LectureDetailsVO> selectLectureDetails(String lec_code) {
		return lectureDAO.selectLectureDetails(lec_code);
	}

	@Override
	public List<SugangLecSTVO> selectProfessorSugangList(String staff_no) {
		return lectureDAO.selectProfessorSugangList(staff_no);
	}

	@Override
	public List<SetTaskVO> selectTask(String id) {
		return lectureDAO.selectTask(id);
	}

	@Override
	public List<LectureDetailsVO> selectTodayLecList(String id) {
		return lectureDAO.selectTodayLecList(id);
	}
}
