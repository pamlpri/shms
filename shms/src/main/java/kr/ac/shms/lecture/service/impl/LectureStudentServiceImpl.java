package kr.ac.shms.lecture.service.impl;

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
import org.springframework.transaction.annotation.Transactional;

import kr.ac.shms.common.enumpkg.ServiceResult;
import kr.ac.shms.common.vo.AttachVO;
import kr.ac.shms.lecture.dao.LectureStudentDAO;
import kr.ac.shms.lecture.service.LectureStudentService;
import kr.ac.shms.lecture.vo.SetTaskVO;
import kr.ac.shms.lecture.vo.TaskSubmitVO;
import kr.ac.shms.lms.student.vo.AttendVO;
import kr.ac.shms.lms.student.vo.LectureVO;
import kr.ac.shms.lms.student.vo.StudentVO;

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
 * 2021. 6. 14. 	 박초원				전체 강의 주/회차별 조회
 * 2021. 6. 15.      박초원			    비대면 강의 진도율, 출석
 * 2021. 6. 15. 	 송수미	      학생 과제 목록 조회, 과제 등록, 수정
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */

@Service
public class LectureStudentServiceImpl implements LectureStudentService {
	private static final Logger logger = LoggerFactory.getLogger(LectureServiceImpl.class);
	@Inject
	private LectureStudentDAO lectureStudentDAO;
	
	@Value("#{appInfo['ip']}")
	private String ip;
	@Value("#{appInfo['port']}")
	private int port;
	@Value("#{appInfo['id']}")
	private String id;
	@Value("#{appInfo['pw']}")
	private String pw;
	
	@Override
	public StudentVO student(String id) {
		return lectureStudentDAO.student(id);
	}

	@Override
	public List<LectureVO> selectStudentWeeksList(LectureVO lecture) {
		return lectureStudentDAO.selectStudentWeeksList(lecture);
	}

	@Override
	public LectureVO selectStudentWeekDetail(LectureVO lecture) {
		return lectureStudentDAO.selectStudentWeekDetail(lecture);
	}

	@Override
	public ServiceResult insertLectureWeek(LectureVO lecture) {
		ServiceResult result = ServiceResult.FAIL;
		
		int cnt = lectureStudentDAO.insertLectureWeek(lecture);
		if(cnt > 0) {
			result = ServiceResult.OK;
		}
		
		return result;
	}

	@Override
	public ServiceResult insertLectureWeekAttend(AttendVO attend) {
		ServiceResult result = ServiceResult.FAIL;
		
		int cnt = lectureStudentDAO.insertLectureWeekAttend(attend);
		if(cnt > 0) {
			result = ServiceResult.OK;
		}
		
		return result;
	}
	
	@Override
	public List<SetTaskVO> selectTaskList(Map<String, String> search) {
		return lectureStudentDAO.selectTaskList(search);
	}
	
	@Transactional
	@Override
	public ServiceResult insertTask(TaskSubmitVO taskSubmit) {
		ServiceResult result = ServiceResult.FAIL;
		
		int cnt = lectureStudentDAO.insertTask(taskSubmit);
		
		if(cnt > 0) {
			cnt += processes(taskSubmit);
			if(cnt > 0) {
				result = ServiceResult.OK;
			}
		}
		return result;
	}
	
	private int processes(TaskSubmitVO taskSubmit) {
		int cnt = 0;
		List<AttachVO> attachList = taskSubmit.getAttachList();
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
						String dir = "/lecture/" + taskSubmit.getLec_code() + "/taskSubmit";
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
						for(AttachVO attach : taskSubmit.getAttachList()) {
							isUpload = client.storeFile(attach.getSave_file_nm(), new ByteArrayInputStream(attach.getFile().getBytes()));
							if(!isUpload){
								client.logout();
								break;
							}
						}
						logger.info("taskSubmitVO {} ", taskSubmit);
						logger.info("isUpload :{}", isUpload);
						if(isUpload) cnt += lectureStudentDAO.insertAttaches(taskSubmit);
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
	public SetTaskVO selectSetTask(Map<String, Object> search) {
		return lectureStudentDAO.selectSetTask(search);
	}
	
	@Override
	public AttachVO download(AttachVO attachVO) {
		return lectureStudentDAO.selectAttatch(attachVO);
	}

	@Override
	public TaskSubmitVO selectTaskSubmit(int submit_no) {
		return lectureStudentDAO.selectTaskSubmit(submit_no);
		
	}
	
	@Transactional
	@Override
	public ServiceResult updateTask(TaskSubmitVO taskSubmit) {
		ServiceResult result = ServiceResult.FAIL;
		
		int cnt = 0;
		
		TaskSubmitVO savedTask = lectureStudentDAO.selectTaskSubmit(taskSubmit.getSubmit_no());
		logger.info("******************************************************");
		logger.info("saved :{}", savedTask);
		logger.info("saved :{}", savedTask.getAtch_file_no());
		logger.info("******************************************************");
		
		if(savedTask == null) {
			result = ServiceResult.NOTEXIST;
		}else {
			if(savedTask.getAtch_file_no() == null) {
				lectureStudentDAO.updateAtchNo(taskSubmit);
			}
			cnt = lectureStudentDAO.updateTask(taskSubmit);
			if(cnt > 0) {
				cnt += processes(taskSubmit);
				cnt += deleteFileProcesses(taskSubmit);
				if(cnt > 0) {
					result = ServiceResult.OK;
				}
			}
		}
		return result;
	}
	
	private int deleteFileProcesses(TaskSubmitVO taskSubmit) {
		logger.info("deleteFileProcesses : {}", taskSubmit);
		FTPClient client = new FTPClient();
		int cnt = 0;
		int[] delAttNos = taskSubmit.getDelAttNos();
		if(delAttNos!=null && delAttNos.length > 0) {
			List<String> saveNames = lectureStudentDAO.selectSaveNamesForDelete(taskSubmit);
			logger.info("saveNames : {}", saveNames.size());
			try {
				client.connect(ip, port);
				int reply = client.getReplyCode();
				logger.info("client Connect : {}", reply);
				if(FTPReply.isPositiveCompletion(reply)) { // 접속 연결이 됐을 경우 
					if(client.login(id, pw)) {	// FTP 서버 로그인 성공 했을 경우
						System.out.println("Login Success");
						client.setBufferSize(1000);	// 버퍼 사이즈
						client.enterLocalPassiveMode();	// 공유기를 상대로 파일 전송하기 위해 패시브 모드로 지정해줘야함
						String dir = "/lecture/" + taskSubmit.getLec_code() + "/taskSubmit";

						boolean isDirectory = client.changeWorkingDirectory(dir);	// 파일 경로 지정
						logger.info("isDir : {} || {}",isDirectory, dir);
						
						client.setFileType(FTP.BINARY_FILE_TYPE);
						
//						이진 데이터 삭제
						for(String saveName : saveNames) {
							client.deleteFile(saveName);
						}
//						첨부파일의 메타 데이터 삭제
						lectureStudentDAO.deleteAttathes(taskSubmit);
						
						
						client.logout();
						client.disconnect();
					} else {
						client.disconnect(); // 연결 종료
					}
				}
			} catch(Exception e) {
				
			}
		}
		return cnt;
	}	

}
