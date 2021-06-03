package kr.ac.shms.lms.common.service.impl;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.commons.net.ftp.FTPClient;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import kr.ac.shms.common.enumpkg.ServiceResult;
import kr.ac.shms.common.vo.AttachVO;
import kr.ac.shms.common.vo.StaffVO;
import kr.ac.shms.lms.common.dao.LmsCommonDAO;
import kr.ac.shms.lms.common.service.LmsCommonService;
import kr.ac.shms.lms.common.vo.CourseEducVO;
import kr.ac.shms.lms.common.vo.DietVO;
import kr.ac.shms.lms.common.vo.EntschtestDcVO;
import kr.ac.shms.lms.common.vo.FacilityRsvVO;
import kr.ac.shms.lms.common.vo.PagingVO;
import kr.ac.shms.lms.common.vo.UserVO;
import kr.ac.shms.lms.common.vo.WebmailVO;
import kr.ac.shms.main.commuity.vo.ScheduleVO;

/**
 * @author 송수미
 * @since 2021. 5. 31.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일          수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 5. 31.      송수미       최초작성
 * 2021. 06. 02.      송수미       진로교육 목록 조회 추가
 * 2021. 06. 02 	  박초원	웹메일 주소록 검색 추가
 * 2021. 06. 03 	박초원		웹메일 인서트
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Service
public class LmsCommonServiceImpl implements LmsCommonService {
	
	private static final Logger logger = LoggerFactory.getLogger(LmsCommonService.class);
	
	@Inject
	private LmsCommonDAO lmsCommonDAO;
	
	@Value("#{appInfo['ip']}")
	private String ip;
	@Value("#{appInfo['port']}")
	private int port;
	@Value("#{appInfo['id']}")
	private String id;
	@Value("#{appInfo['pw']}")
	private String pw;
	
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
	
	@Override
	public List<UserVO> selectAddressBook(UserVO userVO) {
		return lmsCommonDAO.selectAddressBook(userVO);
	}

	@Override
	public ServiceResult insertWebmail(WebmailVO webmailVO) {
		ServiceResult result = ServiceResult.FAIL;
		
		int cnt = lmsCommonDAO.insertWebmail(webmailVO);
		if(cnt > 0) {
			cnt += processes(webmailVO);
			result = ServiceResult.OK;
		}
		
		return result;
	}

	private int processes(WebmailVO webmailVO) {
		int cnt = 0;
		List<AttachVO> attachList = webmailVO.getAttachList();
		if(attachList != null && attachList.size() > 0) {
			FTPClient client = new FTPClient();
			
			
		}
		
		return 0;
	}
	
	@Override
	public WebmailVO selectWebmail(Map<String, Object> search) {
		// 받은 메일 쪽에서 열었을 때 read_at를 업데이트
		if("inbox".equals(search.get("selectMenu"))){
			lmsCommonDAO.updateReadAt(Integer.parseInt((String)search.get("send_no")));
		}
		
		return lmsCommonDAO.selectWebmail(search);
	}

	@Override
	public ServiceResult deleteWebmail(Map<String, Object> search) {
		ServiceResult result = ServiceResult.FAIL;

		WebmailVO webmail = lmsCommonDAO.selectWebmail(search);
		if(webmail == null) result = ServiceResult.NOTEXIST;
		
		int cnt = lmsCommonDAO.deleteWebmail(search);
		if(cnt > 0) result = ServiceResult.OK;
		
		return result;
	}
}