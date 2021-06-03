package kr.ac.shms.lms.common.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.ac.shms.lecture.service.LectureService;
import kr.ac.shms.lms.login.vo.UserLoginVO;
import kr.ac.shms.lms.student.vo.SugangLecSTVO;

/**
 * @author 김보미
 * @since 2021. 6. 2.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일        수정자        수정내용
 * --------     --------    ----------------------
 * 2021. 6. 2.   김보미        최초작성
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Controller
public class CompleteLectureListController {
	@Inject
	private LectureService lectureService;
	
	@RequestMapping("/lms/completeLecList.do")
	public String completeLectureList(
			@AuthenticationPrincipal(expression="realUser") UserLoginVO user
			, HttpSession session
			, Model model			
			) {
		List<SugangLecSTVO> completeLecList = lectureService.selectCompleteSugangList(user.getUser_id());
		if("ST".equals(user.getUser_section())) {
			session.setAttribute("student", user.getUser_section());
			model.addAttribute("lecListST", completeLecList);
		}
		return "lms/lecture";
	}
}

