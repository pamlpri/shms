package kr.ac.shms.lms.common.controller;

import javax.servlet.http.HttpSession;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.ac.shms.lms.login.vo.UserLoginVO;

/**
 * @author 박초원
 * @since  2021. 5. 21.  
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일        수정자         수정내용
 * --------     --------    ----------------------
 * 2021. 5. 21.  박초원      	최초작성
 * 2021. 5. 27.  김보미			강의개설버튼 조작을 위한 수정
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */

@Controller
public class lectureViewController {
	@RequestMapping("/lms/lectureList.do")
	public String lectureList(
		@AuthenticationPrincipal(expression="realUser") UserLoginVO user
		, HttpSession session
	) {
		if("PR".equals(user.getUser_section())) {
			session.setAttribute("staff", user.getUser_section());
		}
		return "lms/lecture";
	}
}
