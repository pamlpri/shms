package kr.ac.shms.lms.student.service.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.ac.shms.lms.student.dao.StudentDAO;
import kr.ac.shms.lms.student.service.StudentService;
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
 * 2021. 5. 28.   김보미        수강중인 강의 목록, dao 이름 변경
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Service
public class StudentServiceImpl implements StudentService{
	@Inject
	private StudentDAO studentDAO;
	
	@Override
	public StudentVO student(String id) {
		return studentDAO.student(id);
	}
	
	@Override
	public List<SugangLecVO> selectSugangList(String stdnt_no) {
		return (List) studentDAO.selectSugangList(stdnt_no);
	}

}
