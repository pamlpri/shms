package kr.ac.shms.lms.student.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.ac.shms.lms.login.vo.UserLoginVO;
import kr.ac.shms.lms.student.service.TuitionService;
import kr.ac.shms.lms.student.vo.ScholarShipVO;
import kr.ac.shms.lms.student.vo.StudentVO;

/**
 * @author 박초원
 * @since 2021. 6. 11.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일          수정자       수정내용
 * --------     --------    ----------------------
 * 2021. 6. 11.    박초원      	최초작성
 * 2021. 6. 17.    김보미		등록금 신청 내역 조회
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Controller
public class ScholarshipCampusViewController {
	private static final Logger logger = LoggerFactory.getLogger(ScholarshipCampusViewController.class);
	
	@Inject
	private TuitionService tuitionService;
	
	@RequestMapping("/lms/scholarshipCampus.do")
	public String scholarshipCampus(
		@AuthenticationPrincipal(expression="realUser") UserLoginVO user
		, Model model
	) {
		String stdnt_no = user.getUser_id();
		List<ScholarShipVO> schlReqList = tuitionService.selectSchlReqList(stdnt_no);
		
		model.addAttribute("schlReqList", schlReqList);
		return "lms/scholarshipCampus";
	}	
	
	@RequestMapping("/lms/scholarshipCampusView.do")
	public String scholarshipCampusView(
		@AuthenticationPrincipal(expression="realUser") UserLoginVO user
		, @RequestParam("req_no") int req_no
		, Model model
	) {
		logger.info("req_no {}", req_no);
		String stdnt_no = user.getUser_id();
		StudentVO student = tuitionService.selectStudent(stdnt_no);
		ScholarShipVO schl = new ScholarShipVO();
		schl.setStdnt_no(stdnt_no);
		schl.setReq_no(req_no);
		schl = tuitionService.selectSchlReqStudent(schl);
		List<String> attList = tuitionService.selectAttachList(req_no);
		
		model.addAttribute("student", student);
		model.addAttribute("schl", schl);
		model.addAttribute("attList", attList);
		return "lms/scholarshipCampusView";
	}
}


