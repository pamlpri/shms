package kr.ac.shms.lecture.service.impl;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.ac.shms.common.vo.StaffVO;
import kr.ac.shms.lecture.dao.LectureProfessorDAO;
import kr.ac.shms.lecture.service.LectureProfessorService;

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
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */

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
