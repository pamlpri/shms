package kr.ac.shms.lecture.service.impl;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.ac.shms.common.vo.StaffVO;
import kr.ac.shms.lecture.dao.LectureProfessorDAO;
import kr.ac.shms.lecture.service.LectureProfessorService;

@Service
public class LectureProfessorServiceImpl implements LectureProfessorService {
	@Inject
	private LectureProfessorDAO dao;
	
	@Override
	public StaffVO staff(String id) {
		// TODO Auto-generated method stub
		return dao.staff(id);
	}
}
