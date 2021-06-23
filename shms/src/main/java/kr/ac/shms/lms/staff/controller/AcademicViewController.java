package kr.ac.shms.lms.staff.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.ac.shms.common.vo.RegInfoCngVO;
import kr.ac.shms.common.vo.StaffVO;
import kr.ac.shms.common.vo.SubjectVO;
import kr.ac.shms.lms.login.vo.UserLoginVO;
import kr.ac.shms.lms.staff.service.LmsStaffService;
import kr.ac.shms.lms.student.service.StudentService;
import kr.ac.shms.lms.student.vo.MypageVO;

/**
 * @author 박초원
 * @since 2021. 6. 8.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일           수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 6. 8.      박초원      	       최초작성
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Controller
public class AcademicViewController {
	private static final Logger logger = LoggerFactory.getLogger(AcademicViewController.class);
	
	@Inject
	private LmsStaffService lmsStaffService;
	@Inject
	private StudentService studentService;
	
	@RequestMapping("/lms/academicList.do")
	public String academicList(
		@AuthenticationPrincipal(expression="realUser") UserLoginVO user
		, Model model
	) {
		String user_id = user.getUser_id();
		StaffVO staffVO = lmsStaffService.staff(user_id);
		List<MypageVO> studentList = studentService.studentSubList(staffVO.getSub_code());
		
		model.addAttribute("studentList", studentList);
		return  "lms/academicList";
	}
	
	@RequestMapping("/lms/academicView.do")
	public String academicView(
		@AuthenticationPrincipal(expression="realUser") UserLoginVO user
		, @RequestParam("stdnt_no") String stdnt_no
		, Model model
	) {
		MypageVO mypageVO = studentService.regInfo(stdnt_no);
		SubjectVO subjectVO = studentService.subject(mypageVO.getSub_code());
		List<RegInfoCngVO> reginfoCngList = studentService.ReginfoList(mypageVO.getStdnt_no());
		String req_resn_code_name = studentService.reginfo(mypageVO.getStdnt_no());
		
		model.addAttribute("req_resn_code_name", req_resn_code_name);
		model.addAttribute("regInfoCngList", reginfoCngList);
		model.addAttribute("mypage", mypageVO);
		model.addAttribute("subject", subjectVO);
		
		return  "lms/academicView";
	}
	
	@RequestMapping("/lms/academicDetailList.do")
	public String academicDetailList() {
		return "lms/academicDetailList";
	}
}
