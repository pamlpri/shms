package kr.ac.shms.lms.student.service.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.ac.shms.common.enumpkg.ServiceResult;
import kr.ac.shms.common.vo.PagingVO;
import kr.ac.shms.lms.student.dao.CertificateDAO;
import kr.ac.shms.lms.student.service.CertificateService;
import kr.ac.shms.lms.student.vo.CertificateReqVO;
/**
 * @author 김보미
 * @since 2021. 6. 7.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일        수정자        수정내용
 * --------     --------    ----------------------
 * 2021. 6. 7.   김보미        최초작성
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Service
public class CertificateServiceImpl implements CertificateService{
	@Inject
	private CertificateDAO certificateDAO;
	
	@Override
	public List<CertificateReqVO> selectCrtfList(String stdnt_no) {
		return certificateDAO.selectCrtfList(stdnt_no);
	}

	@Override
	public ServiceResult insertCrtfReq(CertificateReqVO crtf) {
		ServiceResult result = ServiceResult.FAIL; 
		int cnt = certificateDAO.insertCrtfReq(crtf);
		if(cnt > 0) { result = ServiceResult.OK; }
		return result;
	}

	@Override
	public CertificateReqVO selectCrtf(CertificateReqVO crtf) {
		return certificateDAO.selectCrtf(crtf);
	}

	@Override
	public String selectCrtfKind(String com_code) {
		return certificateDAO.selectCrtfKind(com_code);
	}

	@Override
	public String selectCrtfReqResn(String com_code) {
		return certificateDAO.selectCrtfReqResn(com_code);
	}

	@Override
	public int selectReginfoCount(CertificateReqVO crtf) {
		return certificateDAO.selectReginfoCount(crtf);
	}
}
