package kr.ac.shms.lms.common.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author 박초원
 * @since 2021. 6. 14.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                  수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 6. 14.      박초원      	       최초작성
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Controller
public class LectureEvaluationController {
	@RequestMapping("/lms/lectureEvaluation.do")
	public String lectureEvaluation() {
		return "lms/lectureEvaluation";
	}
	
	@RequestMapping("/lms/lectureEvaluationView.do")
	public String lectureEvaluationView() {
		return "lms/lectureEvaluationView";
	}
}
