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

@Controller
@RequestMapping("/lms")
public class TimeTableController {
	private static final Logger logger = LoggerFactory.getLogger(TimeTableController.class);
	@Inject
	StudentService sutdentService;
	
	@RequestMapping("/timeTableView.do")
	public String sendForm(
		@AuthenticationPrincipal(expression="realUser") UserLoginVO user
		, Model model
	) {
		logger.info("sendForm?");
		String stdnt_no = user.getUser_id();
		StudentVO studentVO = sutdentService.student(stdnt_no);
		List<TimeTableVO> timeTableList = sutdentService.timeTable(stdnt_no);
		
		model.addAttribute("student", studentVO);
		model.addAttribute("timeTableList", timeTableList);
		
		return "lms/timeTable";
	}
	
	@RequestMapping("/tiemTable.do")
	@ResponseBody
	public List<TimeTableVO> timeTableList(
		@AuthenticationPrincipal(expression="realUser") UserLoginVO user
		, Model model
	) {
		return sutdentService.timeTable(user.getUser_id());
	}
}
