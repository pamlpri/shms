package kr.ac.shms.lecture.service.impl;

import java.io.ByteArrayInputStream;
import java.util.List;

import javax.inject.Inject;

import org.apache.commons.net.ftp.FTP;
import org.apache.commons.net.ftp.FTPClient;
import org.apache.commons.net.ftp.FTPReply;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.ac.shms.common.enumpkg.ServiceResult;
import kr.ac.shms.common.vo.AttachVO;
import kr.ac.shms.common.vo.StaffVO;
import kr.ac.shms.lecture.dao.LectureProfessorDAO;
import kr.ac.shms.lecture.service.LectureProfessorService;
import kr.ac.shms.lecture.vo.SetTaskVO;
import kr.ac.shms.lms.student.vo.LectureVO;
import kr.ac.shms.lms.student.vo.SugangVO;

/**
 * @author 박초원
 * @since 2021. 5. 24.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                  수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 5. 24.      박초원      	       최초작성
 * 2021. 06. 01.     송수미      	       교수 과제 조회
 * 2021. 06. 08.     송수미      	       교수 강의 개설
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */

@Service
public class LectureProfessorServiceImpl implements LectureProfessorService {
	private static final Logger logger = LoggerFactory.getLogger(LectureProfessorServiceImpl.class);	
	@Inject
	private LectureProfessorDAO lectureProfessorDAO;
	
	@Value("#{appInfo['ip']}")
	private String ip;
	@Value("#{appInfo['port']}")
	private int port;
	@Value("#{appInfo['id']}")
	private String id;
	@Value("#{appInfo['pw']}")
	private String pw;
	
	@Override
	public StaffVO staff(String id) {
		// TODO Auto-generated method stub
		return lectureProfessorDAO.staff(id);
	}

	@Override
	public List<SetTaskVO> selectTask(String id) {
		return lectureProfessorDAO.selectTask(id);
	}

	@Override
	public List<LectureVO> selectTodayLecList(String id) {
		return lectureProfessorDAO.selectTodayLecList(id);
	}

	@Override
	public List<LectureVO> selectLecListForOpen(String id) {
		return lectureProfessorDAO.selectLecListForOpen(id);
	}

	@Override
	public SugangVO selectLecForOpen(String lec_code) {
		return lectureProfessorDAO.selectLecForOpen(lec_code);
	}
	
	@Transactional
	@Override
	public ServiceResult insertLecture(SugangVO lecture) {
		ServiceResult result = ServiceResult.FAIL;
		
		int cnt = lectureProfessorDAO.updateLecture(lecture);
		
		if(cnt > 0) {
			cnt += lectureProfessorDAO.insertLectureDetails(lecture);
			cnt += processes(lecture);
			if(cnt > 2) {
				result = ServiceResult.OK;
			}
		}
		return result;
	}
	
	private int processes(SugangVO lecture) {
		int cnt = 0;
		List<AttachVO> attachList = lecture.getAttachList();
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
						
						String dir = "/lecture";
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
						for(AttachVO attach : lecture.getAttachList()) {
							isUpload = client.storeFile(attach.getSave_file_nm(), new ByteArrayInputStream(attach.getFile().getBytes()));
							if(!isUpload){
								client.logout();
								break;
							}
						}
						logger.info("lectureVO {} ", lecture);
						if(isUpload) cnt += lectureProfessorDAO.insertAttaches(lecture);
						logger.info("cnt {}" , cnt);
						client.logout();
						client.disconnect();
						
					}else {
						client.disconnect();
					}
				}
			} catch (Exception e) {
				
			}
		}
		return cnt;
	}

	@Override
	public ServiceResult updateLecture(SugangVO lecture) {
		ServiceResult result = ServiceResult.FAIL;
		
		int cnt = lectureProfessorDAO.updateLecture(lecture);
		
		if(cnt > 0) {
			cnt += lectureProfessorDAO.updateLectureDetails(lecture);
			if(cnt > 1) {
				result = ServiceResult.OK;
			}
		}
		return result;
	}
	
	@Override
	public ServiceResult insertWeeks(LectureVO lecture) {
		ServiceResult result = ServiceResult.FAIL;
		
		int cnt = 0;
		cnt = lectureProfessorDAO.insertWeeks(lecture);
		if(cnt > 0) {
			result = ServiceResult.OK;
		}
		
		return result;
	}

	@Override
	public int selectWeeksMaxWeek(String lec_code) {
		int cnt = 0;
		cnt = lectureProfessorDAO.selectWeeksMaxWeek(lec_code);
		
		return cnt;
	}
	
}
