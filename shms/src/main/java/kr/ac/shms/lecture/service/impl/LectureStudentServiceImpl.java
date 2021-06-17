package kr.ac.shms.lecture.service.impl;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.ac.shms.common.dao.CommonAttachDAO;
import kr.ac.shms.common.enumpkg.ServiceResult;
import kr.ac.shms.common.service.CommonAttachService;
import kr.ac.shms.lecture.dao.LectureStudentDAO;
import kr.ac.shms.lecture.service.LectureStudentService;
import kr.ac.shms.lecture.vo.ExamVO;
import kr.ac.shms.lecture.vo.QuesVO;
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
 * 2021. 6. 15. 	 송수미	      학생 과제 목록 조회, 과제 등록, 수정, 시험 목록 조회
 * 2021. 6. 17. 	 송수미	      시험 정보 조회, 시험 응시
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */

@Service
public class LectureStudentServiceImpl implements LectureStudentService {
	private static final Logger logger = LoggerFactory.getLogger(LectureServiceImpl.class);
	@Inject
	private LectureStudentDAO lectureStudentDAO;
	@Inject
	private CommonAttachDAO commonAttachDAO; 
	@Inject
	private CommonAttachService commonAttachService; 
	
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
			cnt += commonAttachService.processes(taskSubmit, "/lecture/" + taskSubmit.getLec_code() + "/taskSubmit");
			if(cnt > 0) {
				result = ServiceResult.OK;
			}
		}
		return result;
	}
	
	@Override
	public SetTaskVO selectSetTask(Map<String, Object> search) {
		return lectureStudentDAO.selectSetTask(search);
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
		
		if(savedTask == null) {
			result = ServiceResult.NOTEXIST;
		}else {
			if(savedTask.getAtch_file_no() == null) {
				commonAttachDAO.updateAtchNo(taskSubmit);
			}
			cnt = lectureStudentDAO.updateTask(taskSubmit);
			if(cnt > 0) {
				cnt += commonAttachService.processes(taskSubmit, "/lecture/" + taskSubmit.getLec_code() + "/taskSubmit");
				cnt += commonAttachService.deleteFileProcesses(taskSubmit, "/lecture/" + taskSubmit.getLec_code() + "/taskSubmit");
				if(cnt > 0) {
					result = ServiceResult.OK;
				}
			}
		}
		return result;
	}
	

	@Override
	public List<ExamVO> selectExamList(Map<String, String> search) {
		return lectureStudentDAO.selectExamList(search);
	}

	@Override
	public ExamVO selectExamInfo(int exam_no) {
		return lectureStudentDAO.selectExamInfo(exam_no);
	}

	@Override
	public List<QuesVO> selectExamQues(int exam_no) {
		return lectureStudentDAO.selectExamQues(exam_no);
	}	

}
