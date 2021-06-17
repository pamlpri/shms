package kr.ac.shms.lms.student.controller;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.ac.shms.common.enumpkg.ServiceResult;
import kr.ac.shms.lms.login.vo.UserLoginVO;
import kr.ac.shms.lms.student.service.StudentService;
import kr.ac.shms.lms.student.service.TuitionService;
import kr.ac.shms.lms.student.vo.TuitionVO;
import kr.ac.shms.validator.DMBoardInsertGroup;
import kr.ac.shms.validator.TuitionRefundReqInsertGroup;

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
	
	@Inject
	private TuitionService tuitionService;
	
	@Inject
	private StudentService studentService;
	
	@RequestMapping("/lms/tuitionRefund.do")
	public String tuitionRefund(
		@AuthenticationPrincipal(expression="realUser") UserLoginVO user
		, Model model
	) {
		String stdnt_no = user.getUser_id();
		
		/** 서비스 호출**********************************************************************************/
		Map<String, Object> paramMap = new HashMap<>();	
		paramMap.put("stdnt_no", stdnt_no);
		tuitionService.selectRefundMain(paramMap);
		/************************************************************************************************/
	
		/** 자료 구성 ***********************************************************************************/
		model.addAttribute("tuition", paramMap.get("tuition"));
		model.addAttribute("resnList", paramMap.get("resnList"));
		model.addAttribute("refundVO", paramMap.get("refundVO"));
		model.addAttribute("reginfoStat", paramMap.get("reginfoStat"));
		model.addAttribute("refundList", paramMap.get("refundList"));
		model.addAttribute("result", paramMap.get("result"));
		/************************************************************************************************/
		
		return "lms/tuitionRefund";
	}	
	
	@RequestMapping(value="/lms/tuitionRefundForm.do", method=RequestMethod.POST)
	public String sendFormRefund(
		@Validated(TuitionRefundReqInsertGroup.class)
		@AuthenticationPrincipal(expression="realUser") UserLoginVO user
		, @ModelAttribute("tuition") TuitionVO ttion
		, Errors errors
		, Model model
		){
		System.out.println("*********************");
		logger.info("resn {}", ttion.getReq_resn());
		boolean valid = !errors.hasErrors();
		
		String view = null;
		String message = null;
		
		String stdnt_no = user.getUser_id();
		int refund_amt = Integer.parseInt(ttion.getRefund().replace(",", "").trim());
		int pay_dtls_no = ttion.getPay_dtls_no();
		String req_resn = ttion.getReq_resn();
		
		TuitionVO tuition = new TuitionVO();
		tuition.setStdnt_no(stdnt_no);
		tuition.setPay_dtls_no(pay_dtls_no);
		tuition.setRefund_amt(refund_amt);
		tuition.setReq_resn(req_resn);
		
		if(valid) {
			ServiceResult result = tuitionService.insertRefundReq(tuition);
			if(ServiceResult.OK.equals(result)) {
				view = "redirect:/lms/tuitionRefund.do";
			}else {
				message = "환불 신청 실패! 잠시 후에 다시 시도해주세요.";
				view = "lms/tuitionRefund";
			}
		}else {
			message = "필수항목 누락";
			view = "tuitionRefund";
		}
		model.addAttribute("message", message);
		
		return view;
	}
}






