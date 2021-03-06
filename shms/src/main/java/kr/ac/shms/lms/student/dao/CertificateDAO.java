package kr.ac.shms.lms.student.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

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
 * 2021. 6. 8.   김보미        신청증명서 내역
 * 2021. 6. 9.   김보미 	   선택한 증명서에 대한 데이터 조회
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Repository
public interface CertificateDAO {
	
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
	public int insertCrtfReq(CertificateReqVO crtf);
	
	/**
	 * 신청한 증명서 내용 출력
	 * @param crtf
	 * @return 신청한 증명서 내용
	 */
	public CertificateReqVO selectCrtf(CertificateReqVO crtf);
	
	/**
	 * 증명서 종류 
	 * @param crtf_kind
	 * @return
	 */
	public String selectCrtfKind(String com_code);
	
	/**
	 * 신청 사유
	 * @param crtf_req_resn
	 * @return
	 */
	public String selectCrtfReqResn(String com_code);
	
	/**
	 * @param crtf 학번, 증명서종류
	 * @return
	 */
	public int selectReginfoCount(CertificateReqVO crtf);
	
	/**
	 * 선택한 증명서에 출력할 데이터 조회
	 * @param crtf
	 * @return 
	 */
	public CertificateReqVO selectCrtfPrint(CertificateReqVO crtf);

	/**
	 * 휴학증명서 출력을 위한 데이터 조회
	 * @param stdnt_no
	 * @return
	 */
	public CertificateReqVO selectHH(String stdnt_no);
	
	/**
	 * 출력매수 업데이트
	 * @param req_no
	 * @return
	 */
	public int updateIssuedCnt(int req_no);
}


