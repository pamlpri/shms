package kr.ac.shms.lecture.service.impl;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.ac.shms.lecture.dao.LectureStudentDAO;
import kr.ac.shms.lecture.service.LectureStudentService;
import kr.ac.shms.lms.student.vo.StudentVO;

@Service
public class LectureStudentServiceImpl implements LectureStudentService {
	@Inject
	private LectureStudentDAO dao;
	
	@Override
	public StudentVO student(String id) {
		// TODO Auto-generated method stub
		return dao.student(id);
	}
}
