package kr.ac.shms.lecture.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import kr.ac.shms.lecture.service.LectureProfessorService;
import kr.ac.shms.lecture.service.LectureService;
import kr.ac.shms.lms.student.vo.LectureVO;

/**
 * @author 박초원
 * @since 2021. 5. 21.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일         수정자        수정내용
 * --------     --------    ----------------------
 * 2021. 5. 21.  박초원        최초작성
 * 2021. 5. 26.  김보미        수정
 * 2021. 5. 27.  김보미        교수전용페이지로 이동하기 위한 수정
 * 2021. 5. 29.  김보미        교수용 강의 정보
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */

@Controller
@SessionAttributes("lec_code")
public class LectureProfessorIndexController {
	private static final Logger logger = LoggerFactory.getLogger(LectureProfessorIndexController.class);
	@Inject
	private LectureProfessorService lectureProfessorService;
	@Inject
	private LectureService lectureService;
	
	@RequestMapping("/lecture/main.do")
	public String lectureDetailsPR(
			@RequestParam("lec_code") String lec_code
			, Model model
			) {
		LectureVO lectureDetails = lectureService.selectLectureDetails(lec_code);
		model.addAttribute("lecture", lectureDetails);
		model.addAttribute("lec_code", lec_code);
		return "lecture/main";
		
	}

}
