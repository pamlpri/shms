package kr.ac.shms.lecture.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.ac.shms.lecture.service.LectureService;
import kr.ac.shms.lecture.service.LectureStudentService;
import kr.ac.shms.lecture.vo.LectureDetailsVO;
import kr.ac.shms.lms.login.vo.UserLoginVO;
import kr.ac.shms.lms.student.service.StudentService;
import kr.ac.shms.lms.student.vo.StudentVO;
import kr.ac.shms.lms.student.vo.SugangLecSTVO;

/**
 * @author 박초원
 * @since 2021. 5. 21.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일         수정자         수정내용
 * --------     --------    ----------------------
 * 2021. 5. 21.   박초원      	 최초작성
 * 2021. 5. 27.   김보미         학생 전용 페이지로 이동하기 위한 수정
 * 2021. 5. 29.   김보미        학생용 강의 정보
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */

@Controller
public class LectureStudentIndexController {
	private static final Logger logger = LoggerFactory.getLogger(LectureStudentIndexController.class);
	@Inject
	private LectureStudentService lectureStudentService;
	
	@Inject
	private LectureService lectureService;
	
//	@RequestMapping("/lecture/index.do")
//	public String index(
//		@AuthenticationPrincipal(expression="realUser") UserLoginVO user
//		, HttpSession session
//		, HttpServletRequest req
//		, Model model
//	) {
//		StudentVO studentVO = lectureStudentService.student(user.getUser_id());
//		if("ST".equals(user.getUser_section())) {
//			session.setAttribute("student", studentVO.getName());
//		}
//		return "lecture/main";
//	}
	
	@RequestMapping("/lecture/index.do")
	public String lectureDetailsST(
			@RequestParam("lec_code") String lec_code
			, Model model
			) {
		List<LectureDetailsVO> lectureDetails = lectureService.selectLectureDetails(lec_code);
		System.out.println(lectureDetails);
		model.addAttribute("lecture", lectureDetails);
		return "lecture/main";
	}
}


























