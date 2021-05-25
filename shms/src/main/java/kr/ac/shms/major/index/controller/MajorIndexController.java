package kr.ac.shms.major.index.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MajorIndexController {
	@RequestMapping("/major/main.do")
	public String index() {
		return "major/main";
	}
}
