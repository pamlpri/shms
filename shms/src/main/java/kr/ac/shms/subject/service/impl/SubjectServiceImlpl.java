package kr.ac.shms.subject.service.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.ac.shms.common.vo.StaffVO;
import kr.ac.shms.common.vo.SubjectVO;
import kr.ac.shms.subject.dao.SubjectDAO;
import kr.ac.shms.subject.service.SubjectService;

/**
 * @author 송수미
 * @since 2021. 5. 27.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 5. 27.      송수미       최초작성
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Service
public class SubjectServiceImlpl implements SubjectService{

	@Inject
	private SubjectDAO subjectDAO;
	
	@Override
	public SubjectVO selectSub(String sub_code) {
		return subjectDAO.selectSub(sub_code);
	}

	@Override
	public List<StaffVO> selectProf(String sub_code) {
		return subjectDAO.selectProf(sub_code);
	}
	
}
