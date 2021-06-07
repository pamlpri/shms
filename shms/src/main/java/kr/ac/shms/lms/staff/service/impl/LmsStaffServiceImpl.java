package kr.ac.shms.lms.staff.service.impl;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.ac.shms.common.enumpkg.ServiceResult;
import kr.ac.shms.common.vo.StaffVO;
import kr.ac.shms.common.vo.SubjectVO;
import kr.ac.shms.lms.staff.dao.LmsStaffDAO;
import kr.ac.shms.lms.staff.service.LmsStaffService;
import kr.ac.shms.lms.staff.vo.PMyPageVO;
import kr.ac.shms.lms.staff.vo.SMyPageVO;

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
	
	
}
