package kr.ac.shms.lms.common.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.ac.shms.lms.login.vo.UserLoginVO;

@Controller
public class lectureViewController {
	@RequestMapping("/lms/lectureList.do")
	public String lectureList(
		HttpSession session
		,Model model
	) {
		UserLoginVO user = (UserLoginVO) session.getAttribute("user");
		model.addAttribute("user", user);
		return "lms/lecture";
	}
}
