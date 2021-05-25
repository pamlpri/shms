package kr.ac.shms.lms.student.service.impl;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.ac.shms.lms.student.dao.StudentDAO;
import kr.ac.shms.lms.student.service.StudentService;
import kr.ac.shms.lms.student.vo.StudentVO;

@Service
public class StudentServiceImpl implements StudentService{
	@Inject
	private StudentDAO dao;
	@Override
	public StudentVO student(String id) {
		return dao.student(id);
	}

}
