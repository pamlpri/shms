package kr.ac.shms.lecture.controller;

import java.security.Provider.Service;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import kr.ac.shms.common.enumpkg.ServiceResult;
import kr.ac.shms.lecture.service.LectureProfessorService;
import kr.ac.shms.lecture.service.LectureService;
import kr.ac.shms.lecture.vo.ExamVO;

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
public class ExamProfessorController {
	private static final Logger logger = LoggerFactory.getLogger(ExamProfessorController.class);
	@Inject
	private LectureProfessorService lectureProfessorService;
	@Inject
	private LectureService lectureService;
	
	@RequestMapping("/lecture/examAdminForm.do")
	public String examAdminForm(
		@SessionAttribute(name="lec_code", required=false) String lec_code
		, Model model
	) {
		return "lecture/examAdminForm";	
	}
	
	@RequestMapping("/lecture/examInsert.do")
	public String examInsert(
		@SessionAttribute(name="lec_code", required=false) String lec_code
		, @ModelAttribute("exam") ExamVO exam
		, Model model
	) {
		String view = null;
		String message = null;
		exam.setLec_code(lec_code);
		ServiceResult result = lectureProfessorService.insertExam(exam);
		if(ServiceResult.OK.equals(result)) {
			view = "redirect:/lecture/examAdmin.do";
		}else {
			message = "서버 오류입니다.";
			view = "lecture/examAdminForm";
		}
		return "lecture/examAdminForm";	
	}
	
	@RequestMapping("/lecture/examAdmin.do")
	public String examAdmin(
		@SessionAttribute(name="lec_code", required=false) String lec_code
		, Model model
	) {
		return "lecture/examAdmin";
	}
	
	@RequestMapping("/lecture/examAdminList.do")
	public String examAdminList(
		@SessionAttribute(name="lec_code", required=false) String lec_code
		, Model model
	) {
		return "lecture/examAdminList";
	}
	
	@RequestMapping("/lecture/examOMR.do")
	public String examOMR(
			@SessionAttribute(name="lec_code", required=false) String lec_code
			, Model model
		) {
		return "lecture/examOMR";
	}
}
