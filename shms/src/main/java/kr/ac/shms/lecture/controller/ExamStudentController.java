package kr.ac.shms.lecture.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import kr.ac.shms.lecture.service.LectureService;
import kr.ac.shms.lecture.service.LectureStudentService;
import kr.ac.shms.lecture.vo.ExamVO;
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
 * 2021. 6. 16.      송수미      	       학생 시험 목록 조회 기능 구현
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Controller
public class ExamStudentController {
	private static final Logger logger = LoggerFactory.getLogger(ExamStudentController.class);
	
	@Inject
	private LectureStudentService lectureStudentService;
	@Inject
	private LectureService lectureService;
	
	@RequestMapping("/lecture/exam.do")
	public String exam(
			@AuthenticationPrincipal(expression="realUser") UserLoginVO user
			, @SessionAttribute(name="lec_code", required=false) String lec_code
			, Model model
		) {
		/** 파라미터 조회 */
		Map<String, String> search = new HashMap<>();
		search.put("lec_code", lec_code);
		search.put("stdnt_no", user.getUser_id());
		
		/** 서비스 호출 */
		List<ExamVO> examList = lectureStudentService.selectExamList(search);
		
		/** 결과 자료 구성 */
		model.addAttribute("examList", examList);
		logger.info("examList : {}" , examList);
		
		/** 화면설정 후 반환 */
		return "lecture/exam";
	}
	
	@RequestMapping("/lecture/examInfo.do")
	public String examInfo(
		@SessionAttribute(name="lec_code", required=false) String lec_code
		, Model model
	) {
		return "lecture/examInfo";
	}
	
	@RequestMapping("/lecture/examForm.do")
	public String examForm(
			@SessionAttribute(name="lec_code", required=false) String lec_code
			, Model model
		) {
	
		return "lecture/examForm";
	}
	
}
