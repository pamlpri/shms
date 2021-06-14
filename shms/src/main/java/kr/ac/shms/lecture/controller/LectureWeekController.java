package kr.ac.shms.lecture.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import kr.ac.shms.lecture.service.LectureService;
import kr.ac.shms.lecture.service.LectureStudentService;
import kr.ac.shms.lms.login.vo.UserLoginVO;
import kr.ac.shms.lms.student.vo.LectureVO;

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
 * 2021. 6. 14. 	 박초원				전체 강의 주/회차별 조회
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Controller
public class LectureWeekController {
	private static final Logger logger = LoggerFactory.getLogger(LectureWeekController.class);
	
	@Inject
	private LectureStudentService lectureStudentService;
	@Inject
	private LectureService lectureService;
	
	@RequestMapping("/lecture/lectureWeek.do")
	public String lectureWeek(
			@SessionAttribute(name="lec_code", required=false) String lec_code
			,@AuthenticationPrincipal(expression="realUser") UserLoginVO user
			, Model model
		) {
		LectureVO lecture = new LectureVO();
		lecture.setLec_code(lec_code);
		lecture.setStdnt_no(user.getUser_id());
		
		List<LectureVO> weeksList = lectureStudentService.selectStudentWeeksList(lecture);
		model.addAttribute("weeksList", weeksList);
		
		return "lecture/lectureWeek";
	}	
}
