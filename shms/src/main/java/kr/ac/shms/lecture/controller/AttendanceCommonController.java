package kr.ac.shms.lecture.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

import kr.ac.shms.lecture.service.LectureProfessorService;
import kr.ac.shms.lecture.service.LectureService;
import kr.ac.shms.lecture.service.LectureStudentService;
import kr.ac.shms.lms.student.vo.AttendVO;

/**
 * @author 박초원
 * @since 2021. 6. 11.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                  수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 6. 11.      박초원      	       최초작성
 * 2021. 6. 18.   박초원		 학생 출석현황 페이지 강의 기본정보 조회
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Controller
public class AttendanceCommonController {
	private static final Logger logger = LoggerFactory.getLogger(AttendanceCommonController.class);
	
	@Inject
	private LectureService lectureService;
	
	@RequestMapping("/lecture/attendance.do")
	public String attendance(
		@SessionAttribute(name="lec_code", required=false) String lec_code
		, @RequestParam("what") String stdnt_no
		, Model model
	) {
		AttendVO attend = new AttendVO();
		attend.setLec_code(lec_code);
		attend.setStdnt_no(stdnt_no);
		
		List<AttendVO> attendList = lectureService.selectAttendDetail(attend);
		attend = lectureService.selectAttendLecture(attend);
		
		model.addAttribute("attendList", attendList);
		model.addAttribute("attend", attend);
		return "lecture/attendance";
	}
}
