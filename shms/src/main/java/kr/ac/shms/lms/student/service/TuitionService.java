package kr.ac.shms.lms.student.service;

import java.util.List;
import java.util.Map;

import kr.ac.shms.common.enumpkg.ServiceResult;
import kr.ac.shms.lms.student.vo.RefundReqVO;
import kr.ac.shms.lms.student.vo.ScholarShipVO;
import kr.ac.shms.lms.student.vo.TuitionVO;
import kr.ac.shms.main.commuity.vo.ComCodeVO;
import kr.ac.shms.main.commuity.vo.ScheduleVO;

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
 * 2021. 6. 15.   김보미 		등록금 환불
 * 2021. 6. 17.   김보미		장학금 조회
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */

public interface TuitionService {
	
	/**
	 * 학생이 지불한 등록금 내역 조회
	 * @param stdnt_no
	 * @return 
	 */
	public List<TuitionVO> selectTuitionList(String stdnt_no);
	
	/**
	 * 등록금 고지서 조회
	 * @param stdnt_no
	 * @return
	 */
	public TuitionVO selectTuitionBill(String stdnt_no);
	
	/**
	 * 등록금 납부 일정 조회
	 * @return
	 */
	public ScheduleVO selectTuitionPaySchdule();
	
	/**
	 * 등록금 영수증 조회
	 * @param stdnt_no
	 * @return
	 */
	public TuitionVO selectTuitionReceipt(String stdnt_no);
	
	/**
	 * 등록금 환불 신청 사유 조회
	 * @return
	 */
	public List<ComCodeVO> selectRefundResn();
	
	/**
	 * 환불 가능 금액, 등록금납부번호 조회
	 * @param stdnt_no
	 * @return
	 */
	public TuitionVO selectRefundAmt(String stdnt_no);
	
	/**
	 * 수혜장학금조회
	 * @param stdnt_no
	 * @return
	 */
	public int selectRecivSchl(String stdnt_no);
	
	/**
	 * 등록금 환불 등록
	 * @param tuition
	 * @return
	 */
	
	public ServiceResult insertRefundReq(TuitionVO tuition);
	/**
	 * 등록금 환불 페이지 
	 * @param paramMap
	 */
	public void selectRefundMain(Map<String, Object> paramMap);
	
	/**
	 * 등록금 환불 신청 내역 조회
	 * @param stdnt_no
	 * @return
	 */
	public List<RefundReqVO> selectRefundReqList(String stdnt_no);
	
	/**
	 * 환불신청내역이 있는지 조회
	 * @param stdnt_no
	 * @return
	 */
	public ServiceResult selectRefundCount(String stdnt_no);
	
	/**
	 * 수혜 장학금 내역 조회
	 * @param stdnt_no
	 * @return
	 */
	public List<ScholarShipVO> selectRecivSchlList(String stdnt_no);
	
	/**
	 * 장학금 신청 내역 조회
	 * @param stdnt_no
	 * @return
	 */
	public List<ScholarShipVO> selectSchlReqList(String stdnt_no);
}
