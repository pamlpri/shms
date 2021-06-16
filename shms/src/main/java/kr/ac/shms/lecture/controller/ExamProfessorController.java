package kr.ac.shms.lecture.controller;

import javax.inject.Inject;

import org.apache.commons.lang3.StringUtils;
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
		logger.info("exam {}", exam);
		
	   String exam_begin_dt = exam.getExam_begin_dt();
       if(StringUtils.isNotBlank(exam_begin_dt)) 	{
          String date = exam_begin_dt.substring(0, exam_begin_dt.indexOf("T"));
          String time = exam_begin_dt.substring(exam_begin_dt.indexOf("T") + 1);
          String set_exam_begin_dt = date + " " + time;
          exam.setExam_begin_dt(set_exam_begin_dt);
       }
       
       String exam_end_dt = exam.getExam_end_dt();
       if(StringUtils.isNotBlank(exam_end_dt)) 	{
          String date = exam_end_dt.substring(0, exam_end_dt.indexOf("T"));
          String time = exam_end_dt.substring(exam_end_dt.indexOf("T") + 1);
          String set_exam_end_dt = date + " " + time;
          exam.setExam_end_dt(set_exam_end_dt);
       }
		
		exam.setLec_code(lec_code);
		
		String view = null;
		String message = null;
		ServiceResult result = lectureProfessorService.insertExam(exam);
		if(ServiceResult.OK.equals(result)) {
			view = "lecture/examAdmin";
		}else {
			message = "서버 오류입니다.";
			view = "lecture/examAdminForm";
		}
		
		model.addAttribute("message",message);
		return view;	
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
