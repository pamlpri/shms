package kr.ac.shms.lms.staff.service.impl;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.ac.shms.common.enumpkg.ServiceResult;
import kr.ac.shms.common.vo.PagingVO;
import kr.ac.shms.common.vo.RegInfoCngVO;
import kr.ac.shms.common.vo.StaffVO;
import kr.ac.shms.common.vo.SubjectVO;
import kr.ac.shms.lms.login.vo.UserLoginVO;
import kr.ac.shms.lms.staff.dao.LmsStaffDAO;
import kr.ac.shms.lms.staff.service.LmsStaffService;
import kr.ac.shms.lms.staff.vo.AcademicRegistrationVO;
import kr.ac.shms.lms.staff.vo.PMyPageVO;
import kr.ac.shms.lms.staff.vo.SMyPageVO;
import kr.ac.shms.lms.student.vo.ConsultingVO;
import kr.ac.shms.lms.student.vo.ScholarShipVO;
import kr.ac.shms.main.commuity.vo.ComCodeVO;

@Service
public class LmsStaffServiceImpl implements LmsStaffService {
	@Inject
	private LmsStaffDAO lmsStaffDAO;
	
	@Override
	public StaffVO staff(String id) {
		return lmsStaffDAO.staff(id);
	}

	@Override
	public int selectConsltCnt(String id) {
		return lmsStaffDAO.selectConsltCnt(id);
	}

	@Override
	public SubjectVO subject(String staff_no) {
		return lmsStaffDAO.subject(staff_no);
	}

	@Override
	public PMyPageVO pmyPage(String staff_no) {
		return lmsStaffDAO.pmyPage(staff_no);
	}

	@Override
	public ServiceResult webMailUpdate(String staff_no) {
		ServiceResult result = ServiceResult.FAIL;
		int cnt = lmsStaffDAO.webMailUpdate(staff_no);
		if(cnt > 0) { result = ServiceResult.OK; }
		return result;
	}

	@Override
	public ServiceResult mypageUpdate(StaffVO staffVO) {
		ServiceResult result = ServiceResult.FAIL;
		int cnt = lmsStaffDAO.mypageUpdate(staffVO);
		if(cnt > 0) { result = ServiceResult.OK; }
		return result;
	}

	@Override
	public SMyPageVO staffMyPage(String user_no) {
		return lmsStaffDAO.staffMyPage(user_no);
	}

	@Override
	public List<ConsultingVO> consultingList(String staff_no) {
		return lmsStaffDAO.consultingList(staff_no);
	}

	@Override
	public ServiceResult consultingApproval(int req_no) {
		ServiceResult result = ServiceResult.FAIL;
		int cnt = lmsStaffDAO.consultingApproval(req_no);
		if(cnt > 0) { result = ServiceResult.OK; }
		return result;
	}

	@Override
	public ServiceResult consultingCompanion(ConsultingVO consultingVO) {
		ServiceResult result = ServiceResult.FAIL;
		int cnt = lmsStaffDAO.consultingCompanion(consultingVO);
		if(cnt > 0) { result = ServiceResult.OK; }
		return result;
	}

	@Override
	public List<StaffVO> passwordUpdate() {
		return lmsStaffDAO.passwordUpdate();
	}

	@Override
	public int passUpdate(UserLoginVO userLogin) {
		return lmsStaffDAO.passUpdate(userLogin);
	}

	@Override
	public List<RegInfoCngVO> selectReginfoCngStudentList(PagingVO<RegInfoCngVO> pagingVO) {
		return lmsStaffDAO.selectReginfoCngStudentList(pagingVO);
	}

	@Override
	public List<ComCodeVO> selectReqClCode() {
		return lmsStaffDAO.selectReqClCode();
	}

	@Override
	public int selectReginfoCngCount(PagingVO<RegInfoCngVO> pagingVO) {
		return lmsStaffDAO.selectReginfoCngCount(pagingVO);
	}

	@Override
	public List<ScholarShipVO> selectGisaSchlReqList() {
		return lmsStaffDAO.selectGisaSchlReqList();
	}

	@Override
	public ScholarShipVO selectGisaSchlReq(int req_no) {
		return lmsStaffDAO.selectGisaSchlReq(req_no);
	}

	@Override
	public ServiceResult updateSchlStatus(ScholarShipVO schl) {
		ServiceResult result = ServiceResult.FAIL;
		int cnt = lmsStaffDAO.updateSchlStatus(schl);
		if(cnt > 0) { result = ServiceResult.OK; }
		return result;
	}

	@Override
	public List<AcademicRegistrationVO> selectAcademicRegistrationList(PagingVO<AcademicRegistrationVO> pagingVO) {
		return lmsStaffDAO.selectAcademicRegistrationList(pagingVO);
	}

	@Override
	public int selectAcademicRegistrationCount(PagingVO<AcademicRegistrationVO> pagingVO) {
		return lmsStaffDAO.selectAcademicRegistrationCount(pagingVO);
	}
}
