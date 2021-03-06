package kr.ac.shms.lms.student.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.ac.shms.common.dao.OthersDAO;
import kr.ac.shms.common.enumpkg.ServiceResult;
import kr.ac.shms.common.service.CommonAttachService;
import kr.ac.shms.common.vo.RegInfoCngVO;
import kr.ac.shms.common.vo.StaffVO;
import kr.ac.shms.common.vo.SubjectVO;
import kr.ac.shms.lms.common.vo.FacilityRsvVO;
import kr.ac.shms.lms.login.vo.UserLoginVO;
import kr.ac.shms.lms.student.dao.StudentDAO;
import kr.ac.shms.lms.student.service.StudentService;
import kr.ac.shms.lms.student.vo.AttendVO;
import kr.ac.shms.lms.student.vo.BookVO;
import kr.ac.shms.lms.student.vo.ConsultingVO;
import kr.ac.shms.lms.student.vo.EditReqVO;
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
 * 2021. 6.  8.   박초원       수강신청 추가
 * 2021. 6.  9.   최희수	  학과 학생들 출력
 * 2021. 6. 10.	  김보미		입실, 퇴실 카운트
 * 2021. 6. 17.   최희수       이력서/자기소개서 첨삭
 * 2021. 6. 18.	  최희수 		편의시설 - 도서관, 열람실예약, 스터디룸 예약
 * 2021. 6. 20.	  김보미 		자퇴신청등록
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Service
public class StudentServiceImpl implements StudentService{
	
	@Inject
	private OthersDAO othersDAO;
	
	@Inject
	private StudentDAO studentDAO;	
	
	@Inject
	private CommonAttachService commonAttachService;
	
	@Override
	public StudentVO student(String id) {
		return studentDAO.student(id);
	}
	
	@Override
	public Map<String, String> bookLoanCnt(String stdnt_no) {
		return studentDAO.bookLoanCnt(stdnt_no);
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
	public List<ConsultingVO> advisorConsltReqList(String stdnt_no) {
		return studentDAO.advisorConsltReqList(stdnt_no);
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
	public SugangVO selectSugangReqInfo(SugangVO sugang) {
		return studentDAO.selectSugangReqInfo(sugang);
	}
	
	@Override
	public List<SugangVO> selectCartList(String stdnt_no){
		return studentDAO.selectCartList(stdnt_no);
	}

	@Override
	public ServiceResult insertCart(SugangVO sugang) {
		ServiceResult result = ServiceResult.FAIL;
		
		if(studentDAO.selectSugangAuth(sugang) == null) {
			int cnt = studentDAO.insertCart(sugang);
			if(cnt > 0) {
				result = ServiceResult.OK;
			}
		}else {
			result = ServiceResult.PKDUPLICATED;
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

	@Override
	public List<SugangVO> selectRegistrationList(String stdnt_no) {
		return studentDAO.selectRegistrationList(stdnt_no);
	}

	@Override
	public ServiceResult insertRegistration(SugangVO sugang) {
		ServiceResult result = ServiceResult.FAIL;
		
		int cnt = 0;
		cnt = studentDAO.insertRegistration(sugang);
		if(cnt > 0) {
			result = ServiceResult.OK;
		}
	
		return result;
	}
	
	@Override
	public List<MypageVO> studentSubList(StaffVO staffVO) {
		return studentDAO.studentSubList(staffVO);
	}

	@Override
	public List<StudentVO> passwordUpdate() {
		return studentDAO.passwordUpdate();
	}

	@Override
	public int passUpdate(UserLoginVO userLogin) {
		return studentDAO.passUpdate(userLogin);
	}

	@Override
	public void selectMainSuganList(Map<String,Object> paramMap) {
		
		/** 반환객체  */
		
		/** 파라미터 */ 
		SugangVO sugangVO = (SugangVO) paramMap.get("sugangVO");
		String userId = sugangVO.getStdnt_no();
		
		List<Map<String, Object>> collegeList = othersDAO.selectCollegeList();
		/** 학과 조회  */ 
		List<SubjectVO> subjectList = othersDAO.selectSubjectList(null);

		
		/** 수강신청 목록 */ 
		List<SugangVO> dataList = selectSugangList(sugangVO);
		sugangVO.setDataList(dataList);
		
		/** 내가 신청한 목록 조회 */ 
		List<SugangVO> cartList = selectCartList(userId);
		SugangVO sugangReqIndexInfo = selectSugangReqInfo(sugangVO);	
		
		/** 결과 반영 */ 
		paramMap.put("subjectList", subjectList);
		paramMap.put("collegeList", collegeList);
		paramMap.put("cartList", cartList);
		paramMap.put("sugangReqIndexInfo", sugangReqIndexInfo);
		
	}

	@Override
	public List<EditReqVO> selectEditReqList(String stdnt_no) {
		return studentDAO.selectEditReqList(stdnt_no);
	}

	@Transactional
	@Override
	public ServiceResult insertEditReq(EditReqVO editReq) {
		ServiceResult result = ServiceResult.FAIL;
		int cnt = studentDAO.insertEditReq(editReq);
		if(cnt > 0) { result = ServiceResult.OK; }
		return result;
	}

	@Override
	public EditReqVO selectEditReq(int edit_req_no) {
		return studentDAO.selectEditReq(edit_req_no);
	}

	@Override
	public ServiceResult deleteEditReq(EditReqVO editReq) {
		ServiceResult result = ServiceResult.FAIL; 
		int cnt = studentDAO.deleteEditReq(editReq);
		if(cnt > 0) { 
			if(cnt > 0) {
				cnt += commonAttachService.deleteFileProcesses(editReq, "/resume");
				if(cnt > 0) {
					result = ServiceResult.OK;
				}
			}
		}
		return result;
	}

	@Override
	public ServiceResult updateEditReq(EditReqVO editReq) {
		ServiceResult result = ServiceResult.FAIL; 
		int cnt = studentDAO.updateEditReq(editReq);
		if(cnt > 0) { 
			cnt += commonAttachService.processes(editReq, "/resume");
			cnt += commonAttachService.deleteFileProcesses(editReq, "/resume");
			if(cnt > 0) {
				result = ServiceResult.OK;
			}
		}
		return result;
	}

	@Override
	public List<BookVO> selectBookList() {
		return studentDAO.selectBookList();
	}

	@Override
	public List<BookVO> selectBookLoanList(String stdnt_no) {
		return studentDAO.selectBookLoanList(stdnt_no);
	}

	@Override
	public List<FacilityRsvVO> selectFacilityList() {
		return studentDAO.selectFacilityList();
	}

	@Override
	public List<FacilityRsvVO> selectFacilityRsvList(String stdnt_no) {
		return studentDAO.selectFacilityRsvList(stdnt_no);
	}

	@Override
	public ServiceResult insertFacilityRsv(FacilityRsvVO facilityRsv) {
		ServiceResult result = ServiceResult.FAIL;
		int cnt = studentDAO.insertFacilityRsv(facilityRsv);
		if(cnt > 0) { result = ServiceResult.OK; }
		return result;
	}

	@Override
	public ServiceResult insertDrop(RegInfoCngVO reginfoCng) {
		ServiceResult result = ServiceResult.FAIL;
		int cnt = studentDAO.insertDrop(reginfoCng);
		if(cnt > 0) {
			cnt = commonAttachService.processes(reginfoCng, "/reginfoCng");
			result = ServiceResult.OK;
		}
		return result;
	}

	@Override
	public  List<RegInfoCngVO> selectRegInfoCngStudentList(String stdnt_no) {
		return studentDAO.selectRegInfoCngStudentList(stdnt_no);
	}

	@Override
	public RegInfoCngVO selectReginfoCng(RegInfoCngVO cng) {
		return studentDAO.selectReginfoCng(cng);
	}
	
	@Override
	public FacilityRsvVO selectFacilityRsv(String stdnt_no) {
		return studentDAO.selectFacilityRsv(stdnt_no);
	}

	@Override
	public ServiceResult updateFacility(int facility_no) {
		ServiceResult result = ServiceResult.FAIL;
		int cnt = studentDAO.updateFacility(facility_no);
		if(cnt > 0) { result = ServiceResult.OK; }
		return result;
	}

	@Override
	public ServiceResult updateBgdt(String stdnt_no) {
		ServiceResult result = ServiceResult.FAIL;
		int cnt = studentDAO.updateBgdt(stdnt_no);
		if(cnt > 0) { result = ServiceResult.OK; }
		return result;
	}

	@Override
	public ServiceResult updateEnddt(String stdnt_no) {
		ServiceResult result = ServiceResult.FAIL;
		int cnt = studentDAO.updateEnddt(stdnt_no);
		if(cnt > 0) { result = ServiceResult.OK; }
		return result;
	}
	
}