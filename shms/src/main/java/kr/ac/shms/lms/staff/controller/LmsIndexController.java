package kr.ac.shms.lms.staff.controller;
import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.ac.shms.common.vo.StaffVO;
import kr.ac.shms.lms.login.vo.UserLoginVO;
import kr.ac.shms.lms.staff.service.LmsStaffService;
import kr.ac.shms.lms.student.service.StudentService;
/**
 * @author 최희수
 * @since 2021. 05. 22.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 05. 22.  사용자명          최초작성
 * 2021. 05. 26.  최희수             사용자명을 session 에 저장
 * Copyright (c) ${year} by DDIT All right reserved
 * </pre>
 */
@Controller
public class LmsIndexController {
	private static final Logger logger = LoggerFactory.getLogger(LmsIndexController.class);
	@Inject
	private LmsStaffService lmsStaffService;
	@Inject
	private StudentService studentService;
	
	@RequestMapping("/lms/main.do")
	public String index(
		@AuthenticationPrincipal(expression="realUser") UserLoginVO user
		, HttpSession session
		, Model model
	){
		StaffVO staffVO = lmsStaffService.staff(user.getUser_id());
		session.setAttribute("userName", staffVO.getName());
		if(staffVO != null) {
			model.addAttribute("staff", staffVO);
		}
		return "lms/main";
	}
}
