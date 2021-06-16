package kr.ac.shms.lms.student.controller;

import java.text.DecimalFormat;
import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.ac.shms.lecture.service.LectureService;
import kr.ac.shms.lms.login.vo.UserLoginVO;
import kr.ac.shms.lms.student.service.TuitionService;
import kr.ac.shms.lms.student.vo.SugangLecSTVO;
import kr.ac.shms.lms.student.vo.TuitionVO;
import kr.ac.shms.main.commuity.vo.ScheduleVO;

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
 * 2021. 6. 12.  김보미			등록금 고지서 출력
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Controller
public class TuitionBillController {
	private static final Logger logger = LoggerFactory.getLogger(TuitionBillController.class);
	
	@Inject
	private TuitionService tuitionService;
	
	@Inject
	private LectureService lectureService;
	
	@RequestMapping("/lms/tuitionBill.do")
	public String tuitionBill(
		@AuthenticationPrincipal(expression="realUser") UserLoginVO user
		, Model model
	) {
		String stdnt_no = user.getUser_id();
		
		ScheduleVO tuitionPay = tuitionService.selectTuitionPaySchdule();
		TuitionVO tuition = tuitionService.selectTuitionBill(stdnt_no);
		List<SugangLecSTVO> sugangLec = lectureService.selectStudentSugangList(stdnt_no);
		int recivAmt = tuitionService.selectRecivSchl(stdnt_no);
		
		int regAmt = tuition.getRegAmt();
		int tuitionAmt = regAmt - recivAmt;
		DecimalFormat dc = new DecimalFormat("###,###,###");
		String tuAmt = dc.format(tuitionAmt);
		
		model.addAttribute("tuition", tuition);
		model.addAttribute("tuitionPay", tuitionPay);
		model.addAttribute("sugangLec", sugangLec);
		model.addAttribute("recivAmt", recivAmt);
		model.addAttribute("tuAmt", tuAmt);
		return "lms/tuitionBill";
	}
}
