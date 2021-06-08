package kr.ac.shms.lms.student.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.ac.shms.lms.common.service.LmsCommonService;
import kr.ac.shms.lms.login.vo.UserLoginVO;
import kr.ac.shms.lms.staff.service.LmsStaffService;
import kr.ac.shms.lms.student.service.StudentService;
import kr.ac.shms.lms.student.vo.ConsultingVO;
import kr.ac.shms.lms.student.vo.StudentVO;

/**
 * @author 박초원
 * @since 2021. 6. 2.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                  수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 6. 2.      박초원      	       최초작성
 * 2021. 6. 3. 		최희수		지도교수 상담 구현
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Controller
@RequestMapping("/lms")
public class ConsultingController {
	private static final Logger logger = LoggerFactory.getLogger(ConsultingController.class);
	@Inject
	private StudentService studentService;
	@Inject
	private LmsStaffService staffService;
	@Inject
	private LmsCommonService lmsCommonService;
	
	
	@RequestMapping("/consulting.do")
	public String consultingList(
		@AuthenticationPrincipal(expression="realUser") UserLoginVO user
		, @RequestParam("bo_no") String bo_no
		, Model model
	) {
		ConsultingVO consultingVO = lmsCommonService.consulting(bo_no);
		StudentVO studentVO = studentService.student(consultingVO.getStdnt_no());
		
		model.addAttribute("student", studentVO);
		model.addAttribute("consulting", consultingVO);
		model.addAttribute("section", user.getUser_section());
		
		return  "lms/consultingForm";
	}
	
}
