package kr.ac.shms.lecture.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.fasterxml.jackson.databind.ObjectMapper;

import kr.ac.shms.common.enumpkg.MimeType;
import kr.ac.shms.common.enumpkg.ServiceResult;
import kr.ac.shms.lecture.service.LectureService;
import kr.ac.shms.lecture.service.LectureStudentService;
import kr.ac.shms.lms.login.vo.UserLoginVO;
import kr.ac.shms.lms.student.vo.AttendVO;
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
 * 2021. 6. 14. 	 박초원				전체 강의 주/회차별 조회
 * 2021. 6. 15.      박초원			    비대면 강의 진도율
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Controller
public class LectureWeekController {
	private static final Logger logger = LoggerFactory.getLogger(LectureWeekController.class);
	
	@Inject
	private LectureStudentService lectureStudentService;
	@Inject
	private LectureService lectureService;
	
	@RequestMapping("/lecture/lectureWeek.do")
	public String lectureWeek(
			@SessionAttribute(name="lec_code", required=false) String lec_code
			,@AuthenticationPrincipal(expression="realUser") UserLoginVO user
			, Model model
		) {
		LectureVO lecture = new LectureVO();
		lecture.setLec_code(lec_code);
		lecture.setStdnt_no(user.getUser_id());
		
		List<LectureVO> weeksList = lectureStudentService.selectStudentWeeksList(lecture);
		model.addAttribute("weeksList", weeksList);
		
		return "lecture/lectureWeek";
	}	
	
	@RequestMapping("/lecture/lectureVideo.do")
	public String lectureVideo(
		@AuthenticationPrincipal(expression="realUser") UserLoginVO user
		,@SessionAttribute(name="lec_code", required=false) String lec_code
		,@RequestParam("what") int diary_no
		, Model model
	) {
		LectureVO lecture = new LectureVO();
		lecture.setDiary_no(diary_no);
		lecture.setStdnt_no(user.getUser_id());
		
		LectureVO week = lectureStudentService.selectStudentWeekDetail(lecture);
		week.setStdnt_no(user.getUser_id());
		model.addAttribute("week",week);
		
		return "/lecture/lectureVideo";
	}
	
	@RequestMapping("/lecture/lectureWeekInsert.do")
	public String lectureWeekInsert(
		@ModelAttribute("lecture") LectureVO lecture
		,HttpServletResponse resp
	) throws IOException {
		Map<String, Object> resultMap = new HashMap<>();
		ServiceResult result = lectureStudentService.insertLectureWeek(lecture);
		switch(result) {
		case OK:
			resultMap.put("result", ServiceResult.OK);
			break;
		case FAIL:
			resultMap.put("result", ServiceResult.FAIL);
			break;
		}
		
		resp.setContentType(MimeType.JSON.getMime());
		try(
			PrintWriter out = resp.getWriter();	
		){
			ObjectMapper mapper = new ObjectMapper();
			mapper.writeValue(out, resultMap);
		}
		
		return null;
	}
	
	@RequestMapping("/lecture/lectureAttendance.do")
	public String lectureAttendance(
		@ModelAttribute("attend") AttendVO attend
		,HttpServletResponse resp
	) throws IOException {
		Map<String, Object> resultMap = new HashMap<>();
		ServiceResult result = lectureStudentService.insertLectureWeekAttend(attend);
		switch(result) {
		case OK:
			resultMap.put("result", ServiceResult.OK);
			break;
		case FAIL:
			resultMap.put("result", ServiceResult.FAIL);
			break;
		}
		
		resp.setContentType(MimeType.JSON.getMime());
		try(
			PrintWriter out = resp.getWriter();	
		){
			ObjectMapper mapper = new ObjectMapper();
			mapper.writeValue(out, resultMap);
		}
		
		return null;
	}
}
