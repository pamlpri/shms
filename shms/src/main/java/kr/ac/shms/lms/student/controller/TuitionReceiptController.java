package kr.ac.shms.lms.student.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.ac.shms.lms.login.vo.UserLoginVO;
import kr.ac.shms.lms.student.service.TuitionService;
import kr.ac.shms.lms.student.vo.TuitionVO;

/**
 * @author 박초원
 * @since 2021. 6. 9.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일         수정자        수정내용
 * --------     --------    ----------------------
 * 2021. 6. 9.    박초원      	최초작성
 * 2021. 6. 14.   김보미		등록금 영수증 조회
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Controller
public class TuitionReceiptController {
	private static final Logger logger = LoggerFactory.getLogger(TuitionReceiptController.class);
	
	@Inject
	private TuitionService tuitionService;
	
	@RequestMapping("/lms/tuitionReceipt.do")
	public String tuitionReceipt(
		@AuthenticationPrincipal(expression="realUser") UserLoginVO user
		, Model model
	) {
		String stdnt_no = user.getUser_id();
		TuitionVO tuition = tuitionService.selectTuitionReceipt(stdnt_no);
		model.addAttribute("tuition", tuition);
		return "lms/tuitionReceipt";
	}
}
