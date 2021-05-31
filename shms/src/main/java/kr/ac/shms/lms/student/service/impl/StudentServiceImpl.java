package kr.ac.shms.lms.student.service.impl;

import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.ac.shms.common.enumpkg.ServiceResult;
import kr.ac.shms.lms.student.dao.StudentDAO;
import kr.ac.shms.lms.student.service.StudentService;
import kr.ac.shms.lms.student.vo.StudentVO;
import kr.ac.shms.lms.student.vo.SugangLecSTVO;
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
 * 2021. 5. 31.   김보미		출석
 * 2021. 5. 31.   송수미	     학생 통합정보시스템 메인 페이지 구현
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
	public SugangLecSTVO selectQRInfo(SugangLecSTVO attendInfo) {
		return studentDAO.selectQRInfo(attendInfo);
	}

	@Override
	public ServiceResult attend(SugangLecSTVO attendInfo) {
		ServiceResult result = ServiceResult.FAIL;
		int cnt = studentDAO.attend(attendInfo);
		if(cnt > 0) {
			result = ServiceResult.OK;
		}
		return result;
	}
	
	@Override
	public Map<String, String> bookLoanCnt(String stdnt_no) {
		return studentDAO.bookLoanCnt(stdnt_no);
	}
}
