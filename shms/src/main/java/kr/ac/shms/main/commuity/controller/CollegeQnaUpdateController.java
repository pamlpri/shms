package kr.ac.shms.main.commuity.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CollegeQnaUpdateController {
	@RequestMapping("/main/community/collegeQnaForm.do")
	public String collegeQnaUpdate() {
		return "main/community/collegeQnaForm";
	}
}
