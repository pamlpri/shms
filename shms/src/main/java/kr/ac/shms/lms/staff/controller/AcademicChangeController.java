package kr.ac.shms.lms.staff.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.ac.shms.lecture.controller.AttendanceAdminController;

/**
 * @author 박초원
 * @since 2021. 6. 21.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                  수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 6. 21.      박초원      	       최초작성
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Controller
public class AcademicChangeController {
	private static final Logger logger = LoggerFactory.getLogger(AttendanceAdminController.class);
	
	@RequestMapping("/lms/academicChange.do")
	public String academicChange() {
		return "lms/academicChange";
	}
	
	@RequestMapping("/lms/academicChangeView.do")
	public String academicChangeView() {
		return "lms/academicChangeView";
	}
}
