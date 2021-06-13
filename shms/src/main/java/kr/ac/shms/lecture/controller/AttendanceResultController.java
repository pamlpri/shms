package kr.ac.shms.lecture.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class AttendanceResultController {
	@RequestMapping(value="/lecture/attendanceResult.do", method=RequestMethod.POST)
	public String attendanceReulst(
		@RequestParam("attend_time") String attend_time
		, @RequestParam("exit_time") String exit_time
		, @RequestParam("lec_name") String lec_name
		, Model model
		) {
		
		String view = null;
		if(attend_time != null && exit_time == null) {
			model.addAttribute("attend_time", attend_time);
			model.addAttribute("lec_name", lec_name);
			view = "lecture/qrResult";
		}else if(attend_time != null &&exit_time != null) {
			model.addAttribute("exit_time", exit_time);
			model.addAttribute("lec_name", lec_name);
			view = "lecture/qrResult";
		}
		return view;
	}
}
