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

import kr.ac.shms.common.service.CommonService;
import kr.ac.shms.common.vo.LecScoreVO;
import kr.ac.shms.common.vo.SubjectVO;
import kr.ac.shms.lms.login.vo.UserLoginVO;
import kr.ac.shms.lms.student.service.StudentService;
import kr.ac.shms.lms.student.vo.MypageVO;

/**
 * @author 박초원
 * @since 2021. 6. 9.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                  수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 6. 9.      박초원      	       최초작성
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Controller
@RequestMapping("/lms")
public class GradesViewController {
	private static final Logger logger = LoggerFactory.getLogger(GradesViewController.class);
	@Inject
	private StudentService studentService;
	@Inject
	private CommonService commonService;
	
	@RequestMapping("/grades.do")
	public String grades(
		@AuthenticationPrincipal(expression="realUser") UserLoginVO user
		, Model model
	) {
		MypageVO mypageVO = studentService.regInfo(user.getUser_id());
		model.addAttribute("student", mypageVO);
		
		SubjectVO subjectVO = studentService.subject(mypageVO.getSub_code());
		model.addAttribute("subject", subjectVO);
		
		List<LecScoreVO> lecYearList = commonService.lecYear(user.getUser_id());
		model.addAttribute("lecYearList", lecYearList);
		
		LecScoreVO lecScore = new LecScoreVO();
		lecScore.setStdnt_no(user.getUser_id());
		
		List<LecScoreVO> lecScoreList = commonService.lecScoreList(lecScore);
		model.addAttribute("lecScoreList", lecScoreList);
		
		int totalCredit = commonService.totalCredit(lecScore);
		model.addAttribute("totalCredit", totalCredit);
		
		double totalPntVal = commonService.totalPntVal(lecScore);
		model.addAttribute("totalPntVal", totalPntVal);
		
		double selectTotalAvg = commonService.selectTotalAvg(lecScore);
		model.addAttribute("totalAvg", selectTotalAvg);
		
		return "lms/grades";
	}
	
	@RequestMapping(value="/lesScoreList.do", method=RequestMethod.POST, produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public List<LecScoreVO> lecScoreList(
		@AuthenticationPrincipal(expression="realUser") UserLoginVO user
		, @ModelAttribute("search") LecScoreVO lecScoreVO
	) {
		lecScoreVO.setStdnt_no(user.getUser_id());
		
		List<LecScoreVO> lecScoreList = commonService.lecScoreList(lecScoreVO);
		
		return lecScoreList;
	}
	
	@RequestMapping(value="/totalCredit.do", method=RequestMethod.POST, produces=MediaType.APPLICATION_JSON_UTF8_VALUE )
	@ResponseBody
	public int totalCredit(
		@AuthenticationPrincipal(expression="realUser") UserLoginVO user
		, @ModelAttribute("search") LecScoreVO lecScoreVO
	) {
		lecScoreVO.setStdnt_no(user.getUser_id());
		int totalCredit = commonService.totalCredit(lecScoreVO);
		
		return totalCredit;		
	}
	
	@RequestMapping(value="/average.do", method=RequestMethod.POST, produces=MediaType.APPLICATION_JSON_UTF8_VALUE )
	@ResponseBody
	public Map<String, Object> average(
		@AuthenticationPrincipal(expression="realUser") UserLoginVO user
		, @ModelAttribute("search") LecScoreVO lecScoreVO
	) {
		Map<String, Object> map = new HashMap<>();
		lecScoreVO.setStdnt_no(user.getUser_id());
		double totalPntVal = commonService.totalPntVal(lecScoreVO);
		double selectTotalAvg = commonService.selectTotalAvg(lecScoreVO);
		
		map.put("totalPntVal", totalPntVal);
		map.put("selectTotalAvg", selectTotalAvg);
		
		return map;		
	}
}
