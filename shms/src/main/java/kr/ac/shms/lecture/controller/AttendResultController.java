package kr.ac.shms.lecture.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class AttendResultController {
	@RequestMapping("/lecture/attendResult.do")
	public String attendResult(
		@RequestParam("attend_time") String attend_time
		, @RequestParam("exit_time") String exit_time
		) {
		
		return "lecture/qrResult";
	}
}
