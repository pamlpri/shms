package kr.ac.shms.lms.student.controller;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.MediaType;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ac.shms.lms.login.vo.UserLoginVO;

/**
 * @author 박초원
 * @since 2021. 6. 9.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일        수정자         수정내용
 * --------     --------    ----------------------
 * 2021. 6. 9.   박초원      	최초작성
 * 2021. 6. 14.  김보미			환불 구현
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Controller
public class TuitionRefundController {
	private static final Logger logger = LoggerFactory.getLogger(TuitionRefundController.class);
	
	@RequestMapping("/lms/tuitionRefund.do")
	public String tuitionRefund(
		@AuthenticationPrincipal(expression="realUser") UserLoginVO user
		, Model model
	) {
		
		
		return "lms/tuitionRefund";
	}	
	
	@RequestMapping(value="/lms/tuitionRefundForm", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public Map<String, Object> sendFormRefund(){
		
		return null;
	}
}
