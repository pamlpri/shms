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
import kr.ac.shms.common.vo.StaffVO;
import kr.ac.shms.lecture.dao.LectureProfessorDAO;
import kr.ac.shms.lecture.dao.LectureStudentDAO;
import kr.ac.shms.lecture.service.LectureProfessorService;
import kr.ac.shms.lecture.vo.ExamVO;
import kr.ac.shms.lecture.vo.QuesVO;
import kr.ac.shms.lecture.vo.SetTaskVO;
import kr.ac.shms.lecture.vo.TaskSubmitVO;
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
 * 2021. 06. 12.     박초원				 주/회차 등록
 * 2021. 06. 14.   	 송수미              과제 등록, 조회, 수정
 * 2021. 06. 14.	  박초원			 주/회차 조회, 수정
 * 2021. 06. 15.	  박초원			 주/회차 삭제
 * 2021. 06. 15.      박초원 			 교수 시험,문제 출제
 * 2021. 06. 16.      박초원			 교수 시험,문제 조회
 * 2021. 06. 17. 	  박초원			 교수 시험,문제 수정
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */

@Service
public class LectureProfessorServiceImpl implements LectureProfessorService {
	private static final Logger logger = LoggerFactory.getLogger(LectureProfessorServiceImpl.class);	
	@Inject
	private LectureProfessorDAO lectureProfessorDAO;
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
	public ServiceResult deleteWeek(int diary_no) {
		ServiceResult result = ServiceResult.FAIL;
		int cnt = lectureProfessorDAO.deleteWeek(diary_no);
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
	
	@Transactional
	@Override
	public ServiceResult insertSetTask(SetTaskVO setTask) {
		ServiceResult result = ServiceResult.FAIL;
		int cnt = lectureProfessorDAO.insertSetTask(setTask);
		
		if(cnt > 0) {
			cnt += taskProcesses(setTask);
			
			if(cnt > 0) {
				result = ServiceResult.OK; 
			}
		}
		return result;
	}

	@Override
	public List<LectureVO> selectWeeksList(String lec_code) {
		return lectureProfessorDAO.selectWeeksList(lec_code);
	}

	@Override
	public LectureVO selectWeekDetail(int diary_no) {
		return lectureProfessorDAO.selectWeekDetail(diary_no);
	}

	@Override
	public ServiceResult updateWeek(LectureVO lecture) {
		ServiceResult result = ServiceResult.FAIL;
		int cnt = lectureProfessorDAO.updateWeek(lecture);
		if(cnt > 0) {
			result = ServiceResult.OK;
		}
		return result;
	}

	@Override
	public List<SetTaskVO> selectSetTaskList(String lec_code) {
		return lectureProfessorDAO.selectSetTaskList(lec_code);
	}

	@Override
	public SetTaskVO selectSetTaskInfo(Map<String, Object> search) {
		return lectureProfessorDAO.selectSetTaskInfo(search);
	}

	@Override
	public SetTaskVO selectSetTask(int set_task_no) {
		return lectureProfessorDAO.selectSetTask(set_task_no);
	}
	
	@Transactional
	@Override
	public ServiceResult updateSetTask(SetTaskVO setTask) {
		ServiceResult result = ServiceResult.FAIL;
		int cnt = 0;
		
		SetTaskVO savedTask = lectureProfessorDAO.selectSetTask(setTask.getSet_task_no());
		
		if(savedTask == null) {
			result = ServiceResult.NOTEXIST;
		}else {
			if(savedTask.getAtch_file_no() == null) {
				lectureProfessorDAO.updateAtchNo(setTask);
			}
			cnt = lectureProfessorDAO.updateSetTask(setTask);
			if(cnt > 0) {
				cnt += taskProcesses(setTask);
				cnt += deleteFileProcesses(setTask);
				if(cnt > 0) {
					result = ServiceResult.OK;
				}
			}
		}
		return result;
	}

	private int taskProcesses(SetTaskVO setTask) {
		int cnt = 0;		
		List<AttachVO> attachList = setTask.getAttachList();
		if(attachList!=null && attachList.size()>0) {
		
			FTPClient client = new FTPClient();
			try {
				client.connect(ip, port);
				int reply = client.getReplyCode();
				logger.info("client Connect : {}", reply);
				if(FTPReply.isPositiveCompletion(reply)) { // 접속 연결이 됐을 경우 
					if(client.login(id, pw)) {	// FTP 서버 로그인 성공 했을 경우
						System.out.println("Login Success");
						client.setBufferSize(1000);	// 버퍼 사이즈
						client.enterLocalPassiveMode();	// 공유기를 상대로 파일 전송하기 위해 패시브 모드로 지정해줘야함
						String dir = "/lecture/" + setTask.getLec_code() + "/setTask";
						
//						String dir = "/test"; // 해당 게시판에 따라 dir 이 달라져야함
						boolean isDirectory = client.changeWorkingDirectory(dir);	// 파일 경로 지정
						for(AttachVO attach : attachList) {
							attach.setFile_path(dir);
						}
						logger.info("isDir : {} || {}",isDirectory, dir);
						if(!isDirectory) {
							client.mkd(dir);
						}
						client.setFileType(FTP.BINARY_FILE_TYPE);
						
						boolean isUpload = false;
						for(AttachVO attvo : setTask.getAttachList()) {
							isUpload = client.storeFile(attvo.getSave_file_nm(), new ByteArrayInputStream(attvo.getFile().getBytes()));
							if(!isUpload) {
								client.logout();
								break;
							}
						}
						if(isUpload) cnt += lectureProfessorDAO.insertTaskAttaches(setTask);
						
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
	
	private int deleteFileProcesses(SetTaskVO setTask) {
		logger.info("deleteFileProcesses : {}", setTask);
		FTPClient client = new FTPClient();
		int cnt = 0;
		int[] delAttNos = setTask.getDelAttNos();
		if(delAttNos!=null && delAttNos.length > 0) {
			List<String> saveNames = lectureProfessorDAO.selectSaveNamesForDelete(setTask);
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
						String dir = "/lecture" + "/" + setTask.getLec_code() + "/setTask";

						boolean isDirectory = client.changeWorkingDirectory(dir);	// 파일 경로 지정
						logger.info("isDir : {} || {}",isDirectory, dir);
						
						client.setFileType(FTP.BINARY_FILE_TYPE);
						
//						이진 데이터 삭제
						for(String saveName : saveNames) {
							client.deleteFile(saveName);
						}
//						첨부파일의 메타 데이터 삭제
						lectureProfessorDAO.deleteAttathes(setTask);
						
						
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

	@Override
	public List<TaskSubmitVO> selectTaskSubmitList(Map<String, Object> searchMap) {
		return lectureProfessorDAO.selectTaskSubmitList(searchMap);
	}
	
	@Transactional
	@Override
	public ServiceResult insertExam(ExamVO exam) {
		ServiceResult result = ServiceResult.FAIL;
		int cnt = lectureProfessorDAO.insertExam(exam);
		
		if(cnt > 0) {
			cnt += insertQues(exam);
			cnt += examProcesses(exam);
			if(cnt > 0) {
				result = ServiceResult.OK;
			}
		}
		return result;
	}
	
	private int insertQues(ExamVO exam) {
		int cnt = 0;
		List<QuesVO> quesList = exam.getQuesList();
		if(quesList != null && quesList.size() > 0) {
			cnt += lectureProfessorDAO.insertQues(exam);
		}
		return cnt;
	}

	private int examProcesses(ExamVO exam) {
		int cnt = 0;		
		List<AttachVO> attachList = exam.getAttachList();
		if(attachList!=null && attachList.size()>0) {
		
			FTPClient client = new FTPClient();
			try {
				client.connect(ip, port);
				int reply = client.getReplyCode();
				logger.info("client Connect : {}", reply);
				if(FTPReply.isPositiveCompletion(reply)) { 
					if(client.login(id, pw)) {	
						client.setBufferSize(1000);	
						client.enterLocalPassiveMode();	
						
						String dir = "/lecture/" + exam.getExam_no() + "/exam";
						
						boolean isDirectory = client.changeWorkingDirectory(dir);	// 파일 경로 지정
						for(AttachVO attach : attachList) {
							attach.setFile_path(dir);
						}
						logger.info("isDir : {} || {}",isDirectory, dir);
						if(!isDirectory) {
							client.mkd(dir);
						}
						client.setFileType(FTP.BINARY_FILE_TYPE);
						
						boolean isUpload = false;
						for(AttachVO attvo : exam.getAttachList()) {
							isUpload = client.storeFile(attvo.getSave_file_nm(), new ByteArrayInputStream(attvo.getFile().getBytes()));
							if(!isUpload) {
								client.logout();
								break;
							}
						}
						if(isUpload) cnt += lectureProfessorDAO.insertExamAttaches(exam);
						
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

	@Override
	public ServiceResult updateTaskScore(TaskSubmitVO taskSubmit) {
		TaskSubmitVO savedTask = lectureStudentDAO.selectTaskSubmit(taskSubmit.getSubmit_no());
		ServiceResult result = ServiceResult.FAIL;
		int cnt = 0;
		
		if(savedTask == null) {
			result = ServiceResult.NOTEXIST;
		}else {
			cnt = lectureProfessorDAO.updateTaskScore(taskSubmit);
			if(cnt > 0) {
				result = ServiceResult.OK;
			}
		}
		return result;
	}

	@Override
	public List<ExamVO> selectExamList(String lec_code) {
		return lectureProfessorDAO.selectExamList(lec_code);
	}

	@Override
	public ExamVO selectExamDetail(ExamVO exam) {
		return lectureProfessorDAO.selectExamDetail(exam);
	}

	@Override
	public List<ExamVO> selectExamStudentList(ExamVO exam) {
		return lectureProfessorDAO.selectExamStudentList(exam);
	}

	@Override
	public List<QuesVO> selectQuesList(int exam_no) {
		return lectureProfessorDAO.selectQuesList(exam_no);
	}
}
