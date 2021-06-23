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
import kr.ac.shms.common.vo.StaffVO;
import kr.ac.shms.lecture.dao.LectureProfessorDAO;
import kr.ac.shms.lecture.dao.LectureStudentDAO;
import kr.ac.shms.lecture.service.LectureProfessorService;
import kr.ac.shms.lecture.vo.ExamVO;
import kr.ac.shms.lecture.vo.GradeVO;
import kr.ac.shms.lecture.vo.QuesVO;
import kr.ac.shms.lecture.vo.SetTaskVO;
import kr.ac.shms.lecture.vo.TaskSubmitVO;
import kr.ac.shms.lms.student.vo.AttendVO;
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
 * 2021. 6. 21.       박초원 		 교수 학생 출석수정,  출석 성적부 반영
 * 2021. 6. 22. 	  박초원			 서술형, 단답형 채점, 성적 수정
 * 2021. 6. 23.		  박초원			 성적관리
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
	public StaffVO staff(String id) {
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
			cnt += commonAttachService.processes(lecture, "/lecture/" + lecture.getLec_code() + "/plan" );
			if(cnt > 2) {
				result = ServiceResult.OK;
			}
		}
		return result;
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
			cnt += commonAttachService.processes(setTask, "/lecture/" + setTask.getLec_code() + "/setTask");
			
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
				commonAttachDAO.updateAtchNo(setTask);
			}
			cnt = lectureProfessorDAO.updateSetTask(setTask);
			if(cnt > 0) {
				cnt += commonAttachService.processes(setTask, "/lecture/" + setTask.getLec_code() + "/setTask");
				cnt += commonAttachService.deleteFileProcesses(setTask, "/lecture/" + setTask.getLec_code() + "/setTask");
				if(cnt > 0) {
					result = ServiceResult.OK;
				}
			}
		}
		return result;
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
			cnt += commonAttachService.processes(exam, "/lecture/" + exam.getLec_code() + "/exam");
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

	@Transactional
	@Override
	public ServiceResult updateExam(ExamVO exam) {
		ServiceResult result = ServiceResult.FAIL;
		
		int cnt = 0;
		
		ExamVO examVO = lectureProfessorDAO.selectExamDetail(exam);
		if(examVO == null) {
			result = ServiceResult.NOTEXIST;
		}else {
			cnt = lectureProfessorDAO.updateExam(exam);
			if(cnt > 0) {
				cnt += updateQues(exam);
				if(cnt > 0) {
					cnt += insertQues(exam);
					if(cnt > 0) {
						cnt += commonAttachService.deleteFileProcesses(exam, "/lecture/" + exam.getLec_code() + "/exam");
						cnt += commonAttachService.processes(exam, "/lecture/" + exam.getLec_code() + "/exam");
						if(cnt > 0) {
							result = ServiceResult.OK;
						}
					}
				}
			}
		}
		return result;
	}

	public int updateQues(ExamVO exam) {
		int cnt = 0;
		int exam_no = exam.getExam_no();
		cnt += lectureProfessorDAO.updateQues(exam_no);
		
		return cnt;
	}

	@Override
	public List<AttendVO> selectAttendStudentList(String lec_code) {
		return lectureProfessorDAO.selectAttendStudentList(lec_code);
	}

	@Override
	public ServiceResult updateStudentAttend(AttendVO attend) {
		ServiceResult result = ServiceResult.FAIL;
		
		int cnt = lectureProfessorDAO.updateStudentAttend(attend);
		if(cnt > 0) {
			result = ServiceResult.OK;
		}
		
		return result;
	}

	@Override
	public ServiceResult insertAttendGrade(AttendVO attend) {
		ServiceResult result = ServiceResult.FAIL;
		
		List<AttendVO> attendList = attend.getAttendList();
		for(AttendVO attnd : attendList) {
			result = ServiceResult.FAIL;
			int cnt = lectureProfessorDAO.insertAttendGrade(attnd);
			if(cnt > 0) {
				result = ServiceResult.OK;
			}
		}
		
		return result;
	}

	@Override
	public List<QuesVO> selectStudentOMR(ExamVO exam) {
		return lectureProfessorDAO.selectStudentOMR(exam);
	}

	@Override
	public ServiceResult updateExamGrade(ExamVO exam) {
		ServiceResult result = ServiceResult.FAIL;
		
		int cnt = 0;
		List<QuesVO> quesList = exam.getQuesList();
		for(QuesVO ques : quesList) {
			result = ServiceResult.FAIL;
			cnt = lectureProfessorDAO.updateExamGrade(ques);
			if(cnt > 0) {
				result = ServiceResult.OK;
			}
		}
		
		if(ServiceResult.OK.equals(result)) {
			result = ServiceResult.FAIL;
			cnt += lectureProfessorDAO.updateResScore(exam);
			if(cnt > 0) {
				result = ServiceResult.OK;
			}
		}
		
		return result;
	}

	@Override
	public ServiceResult updateAjaxResScore(ExamVO exam) {
		ServiceResult result = ServiceResult.FAIL;
		
		int cnt = lectureProfessorDAO.updateAjaxResScore(exam);
		if(cnt > 0) {
			result = ServiceResult.OK;
		}
		return result;
	}

	@Override
	public ServiceResult insertExamGrade(ExamVO exam) {
		ServiceResult result = ServiceResult.FAIL;
		
		List<ExamVO> examList = exam.getExamList();
		for(ExamVO examVO : examList) {
			logger.info("examVO {}",examVO );
			result = ServiceResult.FAIL;
			int cnt = lectureProfessorDAO.insertExamGrade(examVO);
			if(cnt > 0) {
				result = ServiceResult.OK;
			}
		}
		
		return result;
	}

	@Override
	public List<GradeVO> selectGradeList(String lec_code) {
		return lectureProfessorDAO.selectGradeList(lec_code);
	}

	@Override
	public ServiceResult updateGrade(GradeVO grade) {
		ServiceResult result = ServiceResult.FAIL;
		
		List<GradeVO> gradeList = grade.getGradeList();
		for(GradeVO gradeVO : gradeList) {
			logger.info("gradeVO {}",gradeVO );
			result = ServiceResult.FAIL;
			int cnt = lectureProfessorDAO.updateGrade(gradeVO);
			if(cnt > 0) {
				result = ServiceResult.OK;
			}
		}
		return result;
	}

	@Override
	public ServiceResult updateGradeForAjax(GradeVO grade) {
		ServiceResult result = ServiceResult.FAIL;
		
		int cnt = lectureProfessorDAO.updateGradeForAjax(grade);
		if(cnt > 0) {
			result = ServiceResult.OK;
		}
		return result;
	}
	
}
