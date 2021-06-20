package kr.ac.shms.lecture.service.impl;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import kr.ac.shms.lecture.dao.LectureDAO;
import kr.ac.shms.lecture.service.LectureService;
import kr.ac.shms.lecture.vo.SetTaskVO;
import kr.ac.shms.lms.student.vo.AttendVO;
import kr.ac.shms.lms.student.vo.LectureVO;
import kr.ac.shms.lms.student.vo.SugangLecSTVO;
import kr.ac.shms.lms.student.vo.SugangVO;
/**
 * @author 김보미
 * @since 2021. 5. 28.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일         수정자         수정내용
 * --------     --------    ----------------------
 * 2021. 5. 28.   김보미         최초작성
 * 2021. 5. 29.   김보미         교수 강의 목록 
 * 2021. 5. 31.   송수미         학생 과제, 강의 목록 
 * 2021. 6. 02.   김보미         수강 완료 강의 목록 출력
 * 2021. 6. 18.   박초원		 학생 출석현황 페이지 강의 기본정보 조회
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Service
public class LectureServiceImpl implements LectureService{
	private static final Logger logger = LoggerFactory.getLogger(LectureServiceImpl.class);
	
	@Inject
	private LectureDAO lectureDAO;

	@Value("#{appInfo['ip']}")
	private String ip;
	@Value("#{appInfo['port']}")
	private int port;
	@Value("#{appInfo['id']}")
	private String id;
	@Value("#{appInfo['pw']}")
	private String pw;

	@Override
	public List<SugangLecSTVO> selectStudentSugangList(String stdnt_no) {
		return lectureDAO.selectStudentSugangList(stdnt_no);
	}

	@Override
	public LectureVO selectLectureDetails(String lec_code) {
		return lectureDAO.selectLectureDetails(lec_code);
	}

	@Override
	public List<SugangLecSTVO> selectProfessorSugangList(String staff_no) {
		return lectureDAO.selectProfessorSugangList(staff_no);
	}

	@Override
	public List<SetTaskVO> selectTask(String id) {
		return lectureDAO.selectTask(id);
	}

	@Override
	public List<LectureVO> selectTodayLecList(String id) {
		return lectureDAO.selectTodayLecList(id);
	}

	@Override
	public List<SugangLecSTVO> selectCompleteSugangList(String stdnt_no) {
		return lectureDAO.selectCompleteSugangList(stdnt_no);
	}

	@Override
	public AttendVO selectAttendLecture(AttendVO attend) {
		return lectureDAO.selectAttendLecture(attend);
	}

	@Override
	public List<AttendVO> selectAttendDetail(AttendVO attend) {
		return lectureDAO.selectAttendDetail(attend);
	}

	@Override
	public List<SugangVO> selectAllLecList(String staff_no) {
		return lectureDAO.selectAllLecList(staff_no);
	}

}
