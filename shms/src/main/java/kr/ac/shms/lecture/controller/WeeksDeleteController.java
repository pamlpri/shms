package kr.ac.shms.lecture.controller;

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
import kr.ac.shms.lms.student.vo.LectureVO;

/**
 * @author 박초원
 * @since 2021. 6. 15.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                  수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 6. 15.      박초원      	       최초작성
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Controller
public class WeeksDeleteController {
	private static final Logger logger = LoggerFactory.getLogger(WeeksInsertController.class);
	@Inject
	private LectureProfessorService lectureProfessorService;
	@Inject
	private LectureService lectureService;
	
	@RequestMapping("/lecture/weeksDelete.do")
	public String weeksForm(
			@SessionAttribute(name="lec_code", required=false) String lec_code
			,@ModelAttribute("lecture") LectureVO lecture
			, Model model
		) {
		ServiceResult result = ServiceResult.FAIL;
		String view = null;
		String message = null;
		
		result = lectureProfessorService.deleteWeek(lecture.getDiary_no());
		LectureVO week = lectureProfessorService.selectWeekDetail(lecture.getDiary_no());
		if(ServiceResult.OK.equals(result)) {
			view = "redirect:/lecture/weeks.do";
		}else {
			model.addAttribute("week", week);
			message = "필수항목 누락";
			view = "lecture/weeksForm";
		}
		
		return view;
	}
}
