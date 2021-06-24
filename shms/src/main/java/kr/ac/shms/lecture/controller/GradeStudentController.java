package kr.ac.shms.lecture.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import kr.ac.shms.lecture.service.LectureProfessorService;
import kr.ac.shms.lecture.service.LectureService;
import kr.ac.shms.lecture.service.LectureStudentService;
import kr.ac.shms.lecture.vo.GradeVO;
import kr.ac.shms.lms.login.vo.UserLoginVO;

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
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Controller
@SessionAttributes("lec_code")
public class GradeStudentController {
	private static final Logger logger = LoggerFactory.getLogger(GradeStudentController.class);
	
	@Inject
	private LectureStudentService lectureStudentService;
	
	@RequestMapping("/lecture/grade.do")
	public String grade(
		@SessionAttribute(name="lec_code", required=false) String lec_code
		,@AuthenticationPrincipal(expression="realUser") UserLoginVO user
		, Model model
	) {
		GradeVO grade = new GradeVO();
		grade.setStdnt_no(user.getUser_id());
		grade.setLec_code(lec_code);
		
		GradeVO mid = lectureStudentService.selectMidScore(grade);
		GradeVO finals = lectureStudentService.selectFinalScore(grade);
		GradeVO attend = lectureStudentService.selectAttendScore(grade);
		GradeVO task = lectureStudentService.selectTaskScore(grade);
		
		model.addAttribute("mid", mid);
		model.addAttribute("finals", finals);
		model.addAttribute("attend", attend);
		model.addAttribute("task", task);
		return "lecture/grade";
	}
}
