package kr.ac.shms.lms.common.service.impl;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.ac.shms.common.vo.StaffVO;
import kr.ac.shms.lms.common.dao.LmsCommonDAO;
import kr.ac.shms.lms.common.service.LmsCommonService;
import kr.ac.shms.lms.common.vo.CourseEducVO;
import kr.ac.shms.lms.common.vo.DietVO;
import kr.ac.shms.lms.common.vo.EntschtestDcVO;
import kr.ac.shms.lms.common.vo.FacilityRsvVO;
import kr.ac.shms.lms.common.vo.WebmailVO;
import kr.ac.shms.main.commuity.vo.PagingVO;
import kr.ac.shms.main.commuity.vo.ScheduleVO;

/**
 * @author 송수미
 * @since 2021. 5. 31.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 5. 31.      송수미       최초작성
 * 2021. 06. 02.      송수미       진로교육 목록 조회 추가
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
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

	@Override
	public List<CourseEducVO> selectCourseEducList() {
		return lmsCommonDAO.selectCourseEducList();
	}

	@Override
	public int selectLmsBoardCnt(Map<String, String> search) {
		return lmsCommonDAO.selectLmsBoardCnt(search);
	}

	@Override
	public List<EntschtestDcVO> selectEntDcList() {
		return lmsCommonDAO.selectEntDcList();
	}

	@Override
	public List<StaffVO> selectProfInfo(String sub_code) {
		return lmsCommonDAO.selectProfInfo(sub_code);
	}

	@Override
	public List<FacilityRsvVO> selectFacilityRsvList() {
		return lmsCommonDAO.selectFacilityRsvList();
	}

	@Override
	public List<ScheduleVO> selectTestSchdulList() {
		return lmsCommonDAO.selectTestSchdulList();
	}

	@Override
	public List<Map<String, Object>> selectGenCnt(String sub_code) {
		return lmsCommonDAO.selectGenCnt(sub_code);
	}

	@Override
	public List<WebmailVO> selectWebmailList(PagingVO<WebmailVO> search) {
		return lmsCommonDAO.selectWebmailList(search);
	}

	@Override
	public int selectWebmailtotalCnt(PagingVO<WebmailVO> search) {
		return lmsCommonDAO.selectWebmailtotalCnt(search);
	}
	
	
}
