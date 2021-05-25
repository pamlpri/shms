package kr.ac.shms.admission.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller  
public class AdmissionIndexContoller {
	@RequestMapping("/admission/main.do")
	public String index() {
		return "admission/main";
	}
}
