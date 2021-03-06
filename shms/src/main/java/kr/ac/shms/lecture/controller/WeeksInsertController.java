package kr.ac.shms.lecture.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import kr.ac.shms.common.enumpkg.ServiceResult;
import kr.ac.shms.lecture.service.LectureProfessorService;
import kr.ac.shms.lecture.service.LectureService;
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
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Controller
public class WeeksInsertController {
	private static final Logger logger = LoggerFactory.getLogger(WeeksInsertController.class);
	@Inject
	private LectureProfessorService lectureProfessorService;
	@Inject
	private LectureService lectureService;
	
	@RequestMapping("/lecture/weeksForm.do")
	public String weeksForm(
			@SessionAttribute(name="lec_code", required=false) String lec_code
			, Model model
		) {
		int max = lectureProfessorService.selectWeeksMaxWeek(lec_code);
		model.addAttribute("max", max);
		model.addAttribute("insert", "insert");
		return "lecture/weeksForm";
	}
	
	@RequestMapping("/lecture/weeksInsert.do")
	public String weeksInsert(
		@SessionAttribute(name="lec_code", required=false) String lec_code
 		, @ModelAttribute("lecture") LectureVO lecture
		, Model model
	) {
		lecture.setLec_code(lec_code);
		
		String message = null;
		String view = null;
		
		ServiceResult result = lectureProfessorService.insertWeeks(lecture);
		if(ServiceResult.OK.equals(result)) {
			view = "redirect:/lecture/weeks.do";
		}else {
			model.addAttribute(lecture);
			message = "서버 오류입니다.";
			view = "lecture/weeksForm";
		}
		
		return view;
	}
	
}
