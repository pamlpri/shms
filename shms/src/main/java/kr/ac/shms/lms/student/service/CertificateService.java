package kr.ac.shms.lms.student.service;

import java.util.List;

import kr.ac.shms.common.enumpkg.ServiceResult;
import kr.ac.shms.common.vo.PagingVO;
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
public interface CertificateService {
	/**
	 * 증명서 신청 목록을 출력
	 * @param stdnt_no 학번
	 * @return 증명서 신청목록
	 */
	public List<CertificateReqVO> selectCrtfList(String stdnt_no);

	/**
	 * 증명서 신청 정보 insert
	 * @param crtf 증명서 신청 정보
	 * @return 
	 */
	public ServiceResult insertCrtfReq(CertificateReqVO crtf);
}
