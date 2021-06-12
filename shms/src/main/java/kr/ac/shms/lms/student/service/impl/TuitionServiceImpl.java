package kr.ac.shms.lms.student.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.ac.shms.lms.student.dao.StudentDAO;
import kr.ac.shms.lms.student.dao.TuitionDAO;
import kr.ac.shms.lms.student.service.TuitionService;
import kr.ac.shms.lms.student.vo.SugangVO;
import kr.ac.shms.lms.student.vo.TuitionVO;

/**
 * @author 김보미
 * @since 2021. 6. 12.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일         수정자        수정내용
 * --------     --------    ----------------------
 * 2021. 6. 12.   김보미        최초작성
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Service
public class TuitionServiceImpl implements TuitionService{
	@Inject
	private TuitionDAO tuitionDAO;
	
	@Inject
	private StudentDAO studentDAO;
	
	@Override
	public List<TuitionVO> selectTuitionList(String stdnt_no) {
		return tuitionDAO.selectTuitionList(stdnt_no);
	}

	@Override
	public TuitionVO selectTuitionBill(String stdnt_no) {
		Map<String, Object> resultMap = new HashMap<>();
		List<SugangVO> sugangList = studentDAO.selectRegistrationList(stdnt_no);
		if(sugangList == null) {
			resultMap.put("", "");
		}
		return tuitionDAO.selectTuitionBill(stdnt_no);
	}

}
