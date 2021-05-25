package kr.ac.shms.main.commuity.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CollegeQnaPassCheckController {
	@RequestMapping("/main/community/collegeQnaPass.do")
	public String collegeQnaPassCheck() {
		return "main/community/collegeQnaPass";
	}
}
