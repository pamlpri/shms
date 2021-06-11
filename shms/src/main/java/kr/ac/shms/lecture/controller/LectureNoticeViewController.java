package kr.ac.shms.lecture.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import kr.ac.shms.lecture.service.LectureProfessorService;
import kr.ac.shms.lecture.service.LectureService;
import kr.ac.shms.lecture.service.LectureStudentService;

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
public class LectureNoticeViewController {
	private static final Logger logger = LoggerFactory.getLogger(LectureNoticeViewController.class);
	
	@Inject
	private LectureProfessorService lectureProfessorService;
	@Inject
	private LectureStudentService lectureStudentService;
	@Inject
	private LectureService lectureService;
	
	@RequestMapping("/lecture/notice.do")
	public String notice(
		@SessionAttribute(name="lec_code", required=false) String lec_code
		, Model model
	) {

		return "lecture/notice";
	}
}
