package kr.ac.shms.lms.staff.service.impl;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.ac.shms.common.vo.StaffVO;
import kr.ac.shms.lms.staff.dao.LmsStaffDAO;
import kr.ac.shms.lms.staff.service.LmsStaffService;

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
}
