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

import kr.ac.shms.lecture.service.LectureService;
import kr.ac.shms.lecture.service.LectureStudentService;
import kr.ac.shms.lecture.vo.SetTaskVO;
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
 * 2021. 6. 14.      송수미      	       학생 과제 조회 기능 구현
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Controller
public class TaskViewController {
	private static final Logger logger = LoggerFactory.getLogger(TaskViewController.class);
	
	@Inject
	private LectureStudentService lectureStudentService;
	@Inject
	private LectureService lectureService;
	
	@RequestMapping("/lecture/task.do")
	public String taskList(
			@AuthenticationPrincipal(expression="realUser") UserLoginVO user
			, @SessionAttribute(name="lec_code", required=false) String lec_code
			, @SessionAttribute(name="lec_name", required=false) String lec_name
			, Model model
		) {
		
		/** 파라미터 조회 */
		Map<String, String> search = new HashMap<>();
		search.put("lec_code", lec_code);
		search.put("stdnt_no", user.getUser_id());
		
		/** 서비스 호출 */
		List<SetTaskVO> taskList = lectureStudentService.selectTaskList(search);
		
		/** 반환 */
		model.addAttribute("taskList", taskList);
		
		return "lecture/task";
	}	
}
