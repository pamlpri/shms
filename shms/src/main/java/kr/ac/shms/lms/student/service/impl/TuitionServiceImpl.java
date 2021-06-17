package kr.ac.shms.lms.student.service.impl;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.ac.shms.common.enumpkg.ServiceResult;
import kr.ac.shms.lms.student.dao.StudentDAO;
import kr.ac.shms.lms.student.dao.TuitionDAO;
import kr.ac.shms.lms.student.service.TuitionService;
import kr.ac.shms.lms.student.vo.MypageVO;
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
		return tuitionDAO.selectTuitionBill(stdnt_no);
	}

	@Override
	public ScheduleVO selectTuitionPaySchdule() {
		return tuitionDAO.selectTuitionPaySchdule();
	}

	@Override
	public TuitionVO selectTuitionReceipt(String stdnt_no) {
		return tuitionDAO.selectTuitionReceipt(stdnt_no);
	}

	@Override
	public List<ComCodeVO> selectRefundResn() {
		return tuitionDAO.selectRefundResn();
	}

	@Override
	public TuitionVO selectRefundAmt(String stdnt_no) {
		return tuitionDAO.selectRefundAmt(stdnt_no);
	}

	@Override
	public void selectRefundMain(Map<String, Object> paramMap) {
		String stdnt_no = (String) paramMap.get("stdnt_no");
		TuitionVO tuition = new TuitionVO();
		tuition = tuitionDAO.selectTuitionReceipt(stdnt_no);
		List<ComCodeVO> resnList = tuitionDAO.selectRefundResn();
		TuitionVO refundVO = tuitionDAO.selectRefundAmt(stdnt_no);
		MypageVO info = studentDAO.regInfo(stdnt_no);
		String reginfoStat = info.getReginfo_stat();
		List<RefundReqVO> refundList = tuitionDAO.selectRefundReqList(stdnt_no);
		
		ServiceResult result = ServiceResult.FAIL;
		int cnt = tuitionDAO.selectRefundCount(stdnt_no);
		if(cnt > 0) {
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAIL;
		}
		
		paramMap.put("tuition", tuition);
		paramMap.put("resnList", resnList);
		paramMap.put("refundVO", refundVO);
		paramMap.put("reginfoStat", reginfoStat);
		paramMap.put("refundList", refundList);
		paramMap.put("result", result);
	}

	@Override
	public int selectRecivSchl(String stdnt_no) {
		return tuitionDAO.selectRecivSchl(stdnt_no);
	}

	@Override
	public ServiceResult insertRefundReq(TuitionVO tuition) {
		ServiceResult result = ServiceResult.FAIL;
		int cnt = tuitionDAO.insertRefundReq(tuition);
		if(cnt > 0) {
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAIL;
		}
		return result;
	}

	@Override
	public List<RefundReqVO> selectRefundReqList(String stdnt_no) {
		return tuitionDAO.selectRefundReqList(stdnt_no);
	}

	@Override
	public ServiceResult selectRefundCount(String stdnt_no) {
		ServiceResult result = ServiceResult.FAIL;
		int cnt = tuitionDAO.selectRefundCount(stdnt_no);
		if(cnt > 0) {
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAIL;
		}
		return result;
	}

	@Override
	public List<ScholarShipVO> selectRecivSchlList(String stdnt_no) {
		return tuitionDAO.selectRecivSchlList(stdnt_no);
	}
}