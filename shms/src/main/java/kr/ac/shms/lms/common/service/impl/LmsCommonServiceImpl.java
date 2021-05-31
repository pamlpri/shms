package kr.ac.shms.lms.common.service.impl;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.ac.shms.lms.common.dao.LmsCommonDAO;
import kr.ac.shms.lms.common.service.LmsCommonService;
import kr.ac.shms.lms.common.vo.DietVO;
import kr.ac.shms.main.commuity.vo.ScheduleVO;

@Service
public class LmsCommonServiceImpl implements LmsCommonService {
	@Inject
	private LmsCommonDAO lmsCommonDAO;
	
	@Override
	public DietVO selectDiet() {
		return lmsCommonDAO.selectDiet();
	}

	@Override
	public Map<String, String> selectWebmailCnt(String id) {
		return lmsCommonDAO.selectWebmailCnt(id);
	}

	@Override
	public List<ScheduleVO> selectTodaySchdul() {
		return lmsCommonDAO.selectTodaySchdul();
	}
	
}
