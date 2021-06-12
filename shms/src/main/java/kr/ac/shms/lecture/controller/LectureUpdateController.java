package kr.ac.shms.lecture.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import kr.ac.shms.common.enumpkg.ServiceResult;
import kr.ac.shms.lecture.service.LectureProfessorService;
import kr.ac.shms.lecture.service.LectureService;
import kr.ac.shms.lms.student.vo.LectureVO;
import kr.ac.shms.lms.student.vo.SugangVO;
import kr.ac.shms.validator.LectureInsertGroup;

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
 * 2021. 6. 12.      송수미      	       강의 설정 기능 구현
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Controller
public class LectureUpdateController {
	private static final Logger logger = LoggerFactory.getLogger(LectureUpdateController.class);
	@Inject
	private LectureProfessorService lectureProfessorService;
	@Inject
	private LectureService lectureService;
	@Inject
	private LectureProfessorService lectureProfService;
	
	@RequestMapping("/lecture/lectureSetting.do")
	public String lectureSetting(
			@SessionAttribute(name="lec_code", required=false) String lec_code
			, Model model
		) {
		
		LectureVO lecture = lectureService.selectLectureDetails(lec_code);
		
		model.addAttribute("lecture", lecture);
		
		return "lecture/lectureSetting";
	}
	
	@RequestMapping(value="/lecture/lectureSetting.do", method=RequestMethod.POST)
	public String lectureUpdate(
			@SessionAttribute("lec_code") String lec_code
			,@SessionAttribute("lec_name") String lec_name
			, @Validated(LectureInsertGroup.class)
			@ModelAttribute SugangVO lecture
			, Errors errors
			, Model model
		) {
		
		boolean valid = !errors.hasErrors();
		String view = null;
		String message = null;
		double midterm = 0;
		double finals = 0;
		double attend = 0; 
		double task = 0;
		double etc = 0;
		double sum = 0;
		
		lecture.setLec_code(lec_code);
		if(lecture.getMidterm()!=null) midterm = (double)lecture.getMidterm() / 100;
		if(lecture.getFinals()!=null) finals = (double)lecture.getFinals() / 100;
		if(lecture.getAttend()!=null) attend = (double)lecture.getAttend() / 100;
		if(lecture.getTask()!=null) task = (double)lecture.getTask() / 100;
		if(lecture.getEtc()!=null) etc = (double)lecture.getEtc() / 100;
		
		if(valid) {
			sum = midterm + finals + attend + task + etc;
			if(midterm < 0 || finals < 0 || attend < 0 || task < 0 || etc < 0
				|| midterm > 100 || finals > 100 || attend > 100 || task > 100 || etc > 100 ) {
				message = "평가방법에는 0과 100 사이의 수만 입력할  수 있습니다.";
				view = "lecture/lectureSetting";
			}else if(sum != 1) {
				message = "평가방법의 총합은 100이어야 합니다.";
				view = "lecture/lectureSetting";
			}else {
				ServiceResult result = lectureProfService.updateLecture(lecture);
				if(ServiceResult.OK.equals(result)) {
					logger.info("성공");
					view = "redirect:/lecture/main.do";
				}else {
					logger.info("실패");
					message = "강의 개설에 실패하였습니다. 잠시 후 다시 시도해주세요";
					view = "lecture/lectureSetting";
				}
			}
		}else {
			message = "필수항목 누락";
			view = "lecture/lectureSetting";
		}
		model.addAttribute("lecture", lecture);
		model.addAttribute("message", message);
		
		return view;
	}
}
