package kr.ac.shms.lecture.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class AttendanceResultController {
	@RequestMapping("/lecture/attendanceResult.do")
	public String attendanceReulst(
		@RequestParam("attend_time") String attend_time
		, Model model
		) {
		
		String view = null;
		if(attend_time != null) {
			model.addAttribute("attend_time", attend_time);
			view = "lectrue/qrResult";
		}
		return view;
	}
}
