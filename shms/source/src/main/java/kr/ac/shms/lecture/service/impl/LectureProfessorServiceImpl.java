package kr.ac.shms.lecture.service.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.ac.shms.common.vo.StaffVO;
import kr.ac.shms.lecture.dao.LectureProfessorDAO;
import kr.ac.shms.lecture.service.LectureProfessorService;
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

@Service
public class LectureProfessorServiceImpl implements LectureProfessorService {
	@Inject
	private LectureProfessorDAO lectureProfessorDAO;
	
	@Override
	public StaffVO staff(String id) {
		// TODO Auto-generated method stub
		return lectureProfessorDAO.staff(id);
	}

	@Override
	public List<SetTaskVO> selectTask(String id) {
		return lectureProfessorDAO.selectTask(id);
	}

	@Override
	public List<LectureDetailsVO> selectTodayLecList(String id) {
		return lectureProfessorDAO.selectTodayLecList(id);
	}
	
	
}
