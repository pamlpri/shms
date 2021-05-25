package kr.ac.shms.main.commuity.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CollegeQnaViewController {
	@RequestMapping("/main/community/collegeQnaList.do")
	public String collegeQnaList() {
		return "main/community/collegeQna";
	}
	
	@RequestMapping("/main/community/collegeQnaView.do")
	public String collegeQnaView() {
		return "main/community/collegeQnaView";
	}
}
