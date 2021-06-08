package kr.ac.shms.lecture.service.impl;

import java.io.ByteArrayInputStream;
import java.util.List;

import javax.inject.Inject;

import org.apache.commons.net.ftp.FTP;
import org.apache.commons.net.ftp.FTPClient;
import org.apache.commons.net.ftp.FTPReply;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

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

	@Override
	public ServiceResult updateLecture(LectureVO lecture) {
		ServiceResult result = ServiceResult.FAIL;
		
		int cnt = lectureProfessorDAO.updateLecture(lecture);
		
		if(cnt > 0) {
			cnt += setDetails(lecture);
			cnt += processes(lecture);
			if(cnt > 2) {
				result = ServiceResult.OK;
			}
		}
		return result;
	}
	
	
	private int setDetails(LectureVO lecture) {
		return lectureProfessorDAO.insertLectureDetails(lecture);
	}

	private int processes(LectureVO lecture) {
		int cnt = 0;
		List<AttachVO> attachList = lecture.getAttachList();
		if(attachList != null && attachList.size() > 0) {
			FTPClient client = new FTPClient();
			
			try {
				client.connect(ip, port);
				int reply = client.getReplyCode();
				if(FTPReply.isPositiveCompletion(reply)) {
					if(client.login(id, pw)) {
						client.setBufferSize(1000);
						client.enterLocalPassiveMode();
						
						String dir = "/lecture";
						boolean isDirectory = client.changeWorkingDirectory(dir);
						for(AttachVO attach : attachList) {
							attach.setFile_path(dir);
						}
						
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
						if(isUpload) cnt += lectureProfessorDAO.insertAttaches(lecture);
						
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
	
}
