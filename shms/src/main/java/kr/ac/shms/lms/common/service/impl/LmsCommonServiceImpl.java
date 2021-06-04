package kr.ac.shms.lms.common.service.impl;

import java.io.ByteArrayInputStream;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.commons.net.ftp.FTP;
import org.apache.commons.net.ftp.FTPClient;
import org.apache.commons.net.ftp.FTPReply;
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
import kr.ac.shms.lms.common.vo.ReceiverVO;
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
 * 2021. 06. 04 	박초원 	    수신자, 첨부파일 추가
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
			cnt += receiver(webmailVO);
			cnt += processes(webmailVO);
			if(cnt > 0) {
				result = ServiceResult.OK;
			}
		}
		return result;
	}
	
	private int receiver(WebmailVO webmailVO) {
		int cnt = 0;
		List<ReceiverVO> receiverList = webmailVO.getReceiverList();
		if(receiverList != null && receiverList.size() > 0) {
			cnt += lmsCommonDAO.insertRreceiver(webmailVO);
		}
		
		return cnt;
	}

	private int processes(WebmailVO webmailVO) {
		int cnt = 0;
		List<AttachVO> attachList = webmailVO.getAttachList();
		if(attachList != null && attachList.size() > 0) {
			FTPClient client = new FTPClient();
			try {
				client.connect(ip, port);
				int reply = client.getReplyCode();
				logger.info("client Connect : {}", reply);
				if(FTPReply.isPositiveCompletion(reply)) {
					if(client.login(id, pw)) {
						client.setBufferSize(1000);
						client.enterLocalPassiveMode();
						
						String dir = "/mail";
						boolean isDirectory = client.changeWorkingDirectory(dir);
						for(AttachVO attach : attachList) {
							attach.setFile_path(dir);
						}
						logger.info("isDir : {} || {}", isDirectory, dir);
						if(!isDirectory) {
							client.mkd(dir);
						}
						client.setFileType(FTP.BINARY_FILE_TYPE);
						
						boolean isUpload = false;
						for(AttachVO attach : webmailVO.getAttachList()) {
							isUpload = client.storeFile(attach.getSave_file_nm(), new ByteArrayInputStream(attach.getFile().getBytes()));
							if(!isUpload) {
								client.logout();
								break;
							}
						}
						logger.info("webmailVO {} ", webmailVO);
						if(isUpload) cnt += lmsCommonDAO.insertAttatches(webmailVO);
						logger.info("cnt {}" , cnt);
						
						client.logout();
						client.disconnect();
					}else {
						client.disconnect();
					}
				}
			}catch(Exception e) {
				
			}
		}
		return cnt;
	}
	
	@Override
	public WebmailVO selectWebmail(Map<String, Object> search) {
		// 받은 메일 쪽에서 열었을 때 read_at를 업데이트
		int send_no = Integer.parseInt(String.valueOf(search.get("send_no")));
		
		if("inbox".equals(search.get("selectMenu"))){
			lmsCommonDAO.updateReadAt(send_no);
		}
		
		return lmsCommonDAO.selectWebmail(send_no);
	}

	@Override
	public ServiceResult deleteWebmail(Map<String, Object> search) {
		ServiceResult result = ServiceResult.FAIL;

		int cnt = lmsCommonDAO.deleteWebmail(search);
		if(cnt > 0) result = ServiceResult.OK;
		
		return result;
	}
}
