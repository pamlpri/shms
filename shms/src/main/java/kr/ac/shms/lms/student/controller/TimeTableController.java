package kr.ac.shms.lms.student.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ac.shms.lms.login.vo.UserLoginVO;
import kr.ac.shms.lms.student.service.StudentService;
import kr.ac.shms.lms.student.vo.StudentVO;
import kr.ac.shms.lms.student.vo.TimeTableVO;

/**
 * @author 작성자명
 * @since 2021. 6. 4.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 6. 4.      최희수       최초작성
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Controller
@RequestMapping("/lms")
public class TimeTableController {
	private static final Logger logger = LoggerFactory.getLogger(TimeTableController.class);
	@Inject
	StudentService sutdentService;
	
	@RequestMapping("/timeTableView.do")
	public String timeTableView(
		@AuthenticationPrincipal(expression="realUser") UserLoginVO user
		, Model model
	) {
		String stdnt_no = user.getUser_id();
		StudentVO studentVO = sutdentService.student(stdnt_no);
		List<TimeTableVO> timeTableList = sutdentService.timeTable(stdnt_no);
		
		model.addAttribute("student", studentVO);
		model.addAttribute("timeTableList", timeTableList);
		
		return "lms/timeTable";
	}
	
	@RequestMapping("/tiemTable.do")
	@ResponseBody
	public List<TimeTableVO> tiemTable(
		@AuthenticationPrincipal(expression="realUser") UserLoginVO user
		, Model model
	) {
		return sutdentService.timeTable(user.getUser_id());
	}
}
