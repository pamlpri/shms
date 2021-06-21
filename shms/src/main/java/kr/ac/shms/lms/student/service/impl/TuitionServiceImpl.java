package kr.ac.shms.lms.student.service.impl;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.ac.shms.common.enumpkg.ServiceResult;
import kr.ac.shms.common.service.CommonAttachService;
import kr.ac.shms.common.vo.AttachVO;
import kr.ac.shms.common.vo.RegInfoCngVO;
import kr.ac.shms.lms.student.dao.StudentDAO;
import kr.ac.shms.lms.student.dao.TuitionDAO;
import kr.ac.shms.lms.student.service.TuitionService;
import kr.ac.shms.lms.student.vo.MypageVO;
import kr.ac.shms.lms.student.vo.RefundReqVO;
import kr.ac.shms.lms.student.vo.ScholarShipVO;
import kr.ac.shms.lms.student.vo.StudentVO;
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
 * 2021. 6. 18.   김보미		장학금 신청 등록
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Service
public class TuitionServiceImpl implements TuitionService{
	@Inject
	private TuitionDAO tuitionDAO;
	@Inject
	private StudentDAO studentDAO;
	
	@Inject
	private CommonAttachService commonAttachService;
	
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
	public int selectRecivSchl(String stdnt_no) {
		return tuitionDAO.selectRecivSchl(stdnt_no);
	}

	@Transactional
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

	@Override
	public List<ScholarShipVO> selectSchlReqList(String stdnt_no) {
		return tuitionDAO.selectSchlReqList(stdnt_no);
	}

	@Override
	public StudentVO selectStudent(String stdnt_no) {
		return tuitionDAO.selectStudent(stdnt_no);
	}
	
	@Transactional
	@Override
	public ServiceResult insertSchl(ScholarShipVO schl) {
		ServiceResult result = ServiceResult.FAIL;
		int cnt = tuitionDAO.insertSchl(schl);
		
		if(cnt > 0) { 
			cnt = commonAttachService.processes(schl, "/scholarship");
			if(cnt > 0) {
				result = ServiceResult.OK;
			}
		}
		return result;
	}
	
	@Override
	public List<AttachVO> selectAttachList(int req_no) {
		return tuitionDAO.selectAttachList(req_no);
	}

	@Override
	public ScholarShipVO selectSchlReqStudent(ScholarShipVO schl) {
		return tuitionDAO.selectSchlReqStudent(schl);
	}

	@Override
	public ServiceResult updateSchl(ScholarShipVO schl) {
		ServiceResult result = ServiceResult.FAIL;
		int cnt = tuitionDAO.updateSchl(schl);
		if(cnt > 0) { 
			cnt += commonAttachService.processes(schl , "/scholarship");
			cnt += commonAttachService.deleteFileProcesses(schl, "/scholarship");
			if(cnt > 0) {
				result = ServiceResult.OK; 
			}
		}
		return result;
	}

	@Override
	public ServiceResult deleteSchl(ScholarShipVO schl) {
		ServiceResult result = ServiceResult.FAIL;
		int cnt = tuitionDAO.deleteSchl(schl);
		if(cnt > 0) { 
			cnt += commonAttachService.deleteFileProcesses(schl, "/scholarship");
			if(cnt > 0) {
				result = ServiceResult.OK; 
			}
		}
		return result;
	}
	
	/******************************************************************************/
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
	public void SchlReqForm(Map<String, Object> paramMap) {
		String stdnt_no = (String) paramMap.get("stdnt_no");
		Integer req_no = (Integer) paramMap.get("req_no");
		Integer cng_req_no = (Integer) paramMap.get("cng_req_no");
		
		ScholarShipVO schl = new ScholarShipVO();
		List<AttachVO> attList = null;
		if(req_no != null) {
			schl.setStdnt_no(stdnt_no);
			schl.setReq_no(req_no);
			schl = tuitionDAO.selectSchlReqStudent(schl);
			attList = tuitionDAO.selectAttachList(req_no);
		}
		
		RegInfoCngVO cng = new RegInfoCngVO();
		if(cng_req_no != null) {
			cng.setStdnt_no(stdnt_no);
			cng.setCng_req_no(cng_req_no);
			cng = studentDAO.selectReginfoCng(cng);
		}
		
		StudentVO student = new StudentVO();
		student = tuitionDAO.selectStudent(stdnt_no);
		
		paramMap.put("cng", cng);
		paramMap.put("student", student);
		paramMap.put("schl", schl);
		paramMap.put("attList", attList);
	}
}