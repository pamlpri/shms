package kr.ac.shms.main.commuity.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class CollegeQnaInsertController {
	@RequestMapping(value="/main/community/collegeQnaForm.do", method=RequestMethod.POST)
	public String collegeQnaInsert() {
		return "main/community/collegeQnaForm";
	}
}
