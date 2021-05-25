package kr.ac.shms.main.commuity.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CollegeScheduleController {
	@RequestMapping("/main/community/collegeSchedule.do")
	public String collegeSchedule() {
		return "main/community/collegeSchedule";
	}
}
