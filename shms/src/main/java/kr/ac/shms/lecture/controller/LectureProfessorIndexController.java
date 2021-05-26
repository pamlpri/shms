package kr.ac.shms.lecture.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.ac.shms.common.vo.StaffVO;
import kr.ac.shms.lecture.service.LectureProfessorService;
import kr.ac.shms.lms.login.vo.UserLoginVO;

/**
 * @author 박초원
 * @since 2021. 5. 21.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 5. 21.      박초원      	 최초작성
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */

@Controller
public class LectureProfessorIndexController {
	private static final Logger logger = LoggerFactory.getLogger(LectureProfessorIndexController.class);
	@Inject
	private LectureProfessorService service;
	
	@RequestMapping("/lecture/main.do")
	public String index(
		HttpSession session
		,Model model
	) {
		UserLoginVO user = (UserLoginVO) session.getAttribute("user");
		StaffVO staffVO = service.staff(user.getUser_id());
		model.addAttribute("staff", staffVO);
		return "lecture/main";
	}
}
