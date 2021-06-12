package kr.ac.shms.lecture.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import kr.ac.shms.lecture.service.LectureProfessorService;
import kr.ac.shms.lecture.service.LectureService;
import kr.ac.shms.lecture.vo.SetTaskVO;

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
 * 2021. 6. 12.      송수미      	       과제 등록 기능 구현
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Controller
public class ReportInsertController {
	private static final Logger logger = LoggerFactory.getLogger(ReportInsertController.class);
	@Inject
	private LectureProfessorService lectureProfessorService;
	@Inject
	private LectureService lectureService;
	
	@RequestMapping("/lecture/reportInsert.do")
	public String reportForm(
			@SessionAttribute(name="lec_code", required=false) String lec_code
			, @SessionAttribute(name="lec_name", required=false) String lec_name
			, Model model
		) {
		
		return "lecture/reportForm";
		
	}
	
	@RequestMapping(value="/lecture/reportInsert.do", method=RequestMethod.POST)
	public String insertReport(
			@SessionAttribute(name="lec_code", required=false) String lec_code
			, @SessionAttribute(name="lec_name", required=false) String lec_name
			, @ModelAttribute("task") SetTaskVO task
			, Model model
		) {
		
		task.setLec_code(lec_code);
		
		String view = null;
		return view;
		
	}
}
