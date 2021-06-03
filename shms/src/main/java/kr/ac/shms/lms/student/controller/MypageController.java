package kr.ac.shms.lms.student.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.MediaType;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ac.shms.common.enumpkg.ServiceResult;
import kr.ac.shms.common.vo.RegInfoCngVO;
import kr.ac.shms.lms.login.vo.UserLoginVO;
import kr.ac.shms.lms.student.service.StudentService;
import kr.ac.shms.lms.student.vo.MypageVO;
import kr.ac.shms.lms.student.vo.StudentVO;
import kr.ac.shms.subject.vo.SubjectVO;

/**
 * @author 박초원
 * @since 2021. 6. 2.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일           수정자          수정내용
 * --------     --------    ----------------------
 * 2021. 6. 2.      박초원      	 최초작성
 * 2021. 6. 2.		최희수	 웹메일 등록
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Controller
@RequestMapping("/lms")
public class MypageController {
	private static final Logger logger = LoggerFactory.getLogger(MypageController.class);
	@Inject
	private StudentService studentService;
	
	@RequestMapping("/myPage.do")
	public String mypage(
			@AuthenticationPrincipal(expression="realUser") UserLoginVO user
			, Model model
		){
		String user_id = user.getUser_id();
		StudentVO studentVO = studentService.student(user_id);
		MypageVO regInfoVO = studentService.regInfo(user_id);
		SubjectVO subjectVO = studentService.subject(regInfoVO.getSub_code());
		List<RegInfoCngVO> regInfoCngList = studentService.ReginfoList(user_id);
		if(studentVO != null) {
			model.addAttribute("student", studentVO);
			model.addAttribute("subject", subjectVO);
			model.addAttribute("regInfo", regInfoVO);
			model.addAttribute("regInfoCngList", regInfoCngList);
		}
		return "lms/myPage";
	}
	@RequestMapping(value="/myPage.do", method=RequestMethod.POST)
	public String mypageUpdate(
			@AuthenticationPrincipal(expression="realUser") UserLoginVO user
			, @ModelAttribute("student") StudentVO student
		) {
		String view = null;
		student.setStdnt_no(user.getUser_id());
		ServiceResult result = studentService.mypageUpdate(student);
		if(ServiceResult.OK.equals(result)) {
			view = "redirect:/lms/myPage.do";
		}
		return view;
	}
	
	@RequestMapping(value="/webMail.do", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public Map<String, String> webMail(
			@AuthenticationPrincipal(expression="realUser") UserLoginVO user
		) {
		ServiceResult result = studentService.webMailUpdate(user.getUser_id());
		Map<String, String> webMail = new HashMap<>();
		if(ServiceResult.OK.equals(result)) {
			StudentVO studentVO = studentService.student(user.getUser_id());
			webMail.put("webMail", studentVO.getWebmail());
		}
		return webMail;
	}
	
}
