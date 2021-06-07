package kr.ac.shms.lms.student.service.impl;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.ac.shms.common.enumpkg.ServiceResult;
import kr.ac.shms.common.vo.RegInfoCngVO;
import kr.ac.shms.common.vo.SubjectVO;
import kr.ac.shms.lms.student.dao.StudentDAO;
import kr.ac.shms.lms.student.service.StudentService;
import kr.ac.shms.lms.student.vo.AttendVO;
import kr.ac.shms.lms.student.vo.ConsultingVO;
import kr.ac.shms.lms.student.vo.LectureVO;
import kr.ac.shms.lms.student.vo.MypageVO;
import kr.ac.shms.lms.student.vo.StudentVO;
import kr.ac.shms.lms.student.vo.SugangLecSTVO;
import kr.ac.shms.lms.student.vo.SugangVO;
import kr.ac.shms.lms.student.vo.TimeTableVO;
import kr.ac.shms.main.commuity.vo.ComCodeVO;
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
 * 2021. 5. 31.   송수미	    학생 통합정보시스템 메인 페이지 구현
 * 2021. 6.  3.   김보미 		학생 정보 출력(증명서 신청), 증명서, 신청사유 정보출력
 * 2021. 6.  4.   최희수	   학생 시간표 출력
 * 2021. 6.  5.   송수미	   수강신청 인덱스 페이지 구현
 * 2021. 6.  7.   박초원       장바구니 조회, 등록, 삭제
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
	public AttendVO selectQRInfo(AttendVO attendInfo) {
		return studentDAO.selectQRInfo(attendInfo);
	}

	@Override
	public ServiceResult attend(AttendVO attendInfo) {
		ServiceResult result = ServiceResult.FAIL;
		int cnt = studentDAO.attend(attendInfo);
		if(cnt > 0) { result = ServiceResult.OK; }
		return result;
	}
	
	@Override
	public ServiceResult exit(AttendVO exitInfo) {
//		AttendVO attendVO = studentDAO.selectAttendInfo(exitInfo);
//		int lec_pnt = attendVO.getLec_pnt();
//		int tm = attendVO.getTm();
//		int lec_fin = lec_pnt + tm;  // 강의 끝나는 시간
//		String exit_time = attendVO.getExit_time();
		
		ServiceResult result = ServiceResult.FAIL;
		int cnt = studentDAO.exit(exitInfo);
		if(cnt > 0) { result = ServiceResult.OK; }
		return result;
	}
	
	@Override
	public Map<String, String> bookLoanCnt(String stdnt_no) {
		return studentDAO.bookLoanCnt(stdnt_no);
	}

	@Override
	public String selectAttendTime(AttendVO attendVO) {
		return studentDAO.selectAttendTime(attendVO);
	}

	@Override
	public ServiceResult webMailUpdate(String stdnt_no) {
		ServiceResult result = ServiceResult.FAIL;
		int cnt = studentDAO.webMailUpdate(stdnt_no);
		if(cnt > 0) { result = ServiceResult.OK; }
		return result;
	}

	@Override
	public SubjectVO subject(String sub_code) {
		return studentDAO.subject(sub_code);
	}

	@Override
	public MypageVO regInfo(String stdnt_no) {
		return studentDAO.regInfo(stdnt_no);
	}

	@Override
	public List<ConsultingVO> consltReqList(String stdnt_no) {
		return studentDAO.consltReqList(stdnt_no);
	}

	@Override
	public ServiceResult mypageUpdate(StudentVO studentVO) {
		ServiceResult result = ServiceResult.FAIL;
		int cnt = studentDAO.mypageUpdate(studentVO);
		if(cnt > 0) {result = ServiceResult.OK; }
		return result;
	}

	@Override
	public List<RegInfoCngVO> ReginfoList(String stdnt_no) {
		return studentDAO.ReginfoList(stdnt_no);
	}

	@Override
	public int payCount(String stdnt_no) {
		return studentDAO.payCount(stdnt_no);
	}

	@Override
	public StudentVO selectStdntInfoForCetf(String stdnt_no) {
		return studentDAO.selectStdntInfoForCetf(stdnt_no);
	}

	@Override
	public List<ComCodeVO> selectCetfList() {
		return studentDAO.selectCetfList();
	}

	@Override
	public List<ComCodeVO> selectCetfResnList() {
		return studentDAO.selectCetfResnList();
	}

	@Override
	public String reginfo(String stdnt_no) {
		return studentDAO.reginfo(stdnt_no);
	}

	@Override
	public ServiceResult consultingDelete(String req_no) {
		ServiceResult result = ServiceResult.FAIL;
		int cnt = studentDAO.consultingDelete(req_no);
		if(cnt > 0) { result = ServiceResult.OK; }
		return result;
	}

	@Override
	public ServiceResult consultingInsert(ConsultingVO consultingVO) {
		ServiceResult result = ServiceResult.FAIL;
		int cnt = studentDAO.consultingInsert(consultingVO);
		if(cnt > 0) { result = ServiceResult.OK; }
		return result;
	}

	@Override
	public ServiceResult consultingUpdate(ConsultingVO consultingVO) {
		ServiceResult result = ServiceResult.FAIL;
		int cnt = studentDAO.consultingUpdate(consultingVO);
		if(cnt > 0) { result = ServiceResult.OK; }
		return result;
	}

	@Override
	public List<SugangLecSTVO> sugangList(String stdnt_no) {
		// TODO Auto-generated method stub
		return studentDAO.sugangList(stdnt_no);
	}

	@Override
	public LectureVO lecture(String lec_code) {
		// TODO Auto-generated method stub
		return studentDAO.lecture(lec_code);
	}

	@Override
	public List<TimeTableVO> timeTable(String stdnt_no) {
		return studentDAO.timeTable(stdnt_no);
	}

	@Override
	public List<SugangVO> selectSugangList(SugangVO sugang) {
		return studentDAO.selectSugangList(sugang);
	}

	@Override
	public SugangVO selectSugangReqInfo(String stdnt_no) {
		return studentDAO.selectSugangReqInfo(stdnt_no);
	}
	
	@Override
	public List<SugangVO> selectCartList(String stdnt_no){
		return studentDAO.selectCartList(stdnt_no);
	}

	@Override
	public ServiceResult insertCart(SugangVO sugang) {
		ServiceResult result = ServiceResult.FAIL;
		
		int cnt = studentDAO.insertCart(sugang);
		if(cnt > 0) {
			result = ServiceResult.OK;
		}
		
		return result;
	}

	@Override
	public ServiceResult deleteCart(SugangVO sugang) {
		ServiceResult result = ServiceResult.FAIL;
		
		int cnt = studentDAO.deleteCart(sugang);
		if(cnt > 0) {
			result = ServiceResult.OK;
		}
		
		return result;
	}

	@Override
	public SugangVO selectSugangInfo(String lec_code) {
		return studentDAO.selectSugangInfo(lec_code);
	}
}