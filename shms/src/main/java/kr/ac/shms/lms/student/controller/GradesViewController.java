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
import kr.ac.shms.common.service.CommonService;
import kr.ac.shms.common.vo.LecScoreVO;
import kr.ac.shms.common.vo.SubjectVO;
import kr.ac.shms.lms.common.service.LmsCommonService;
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
	@Inject
	private LmsCommonService lmsCommonService;
	
	@RequestMapping("/grades.do")
	public String grades(
		@AuthenticationPrincipal(expression="realUser") UserLoginVO user
		, @ModelAttribute("search") LecScoreVO lecScoreVO
		, Model model
	) {
		
		ServiceResult result = lmsCommonService.selectLectureEvaluationCheck(user.getUser_id());
		String view = "redirect:/lms/evaluation.do";
		if(ServiceResult.OK.equals(result)) {
			MypageVO mypageVO = studentService.regInfo(user.getUser_id());
			model.addAttribute("student", mypageVO);
			
			SubjectVO subjectVO = studentService.subject(mypageVO.getSub_code());
			model.addAttribute("subject", subjectVO);
			
			List<LecScoreVO> lecYearList = commonService.lecYear(user.getUser_id());
			model.addAttribute("lecYearList", lecYearList);
			
			LecScoreVO lecScore = new LecScoreVO();
			lecScore.setStdnt_no(user.getUser_id());
			
//			List<LecScoreVO> lecScoreList = commonService.lecScoreList(lecScore);
//			model.addAttribute("lecScoreList", lecScoreList);
			
			List<LecScoreVO> selectStatisticsList = commonService.selectStatisticsList(lecScore);
			model.addAttribute("selectStatisticsList", selectStatisticsList);
			
			List<LecScoreVO> selectSemstrList = commonService.selectSemstrList(lecScore);
			model.addAttribute("selectSemstrList", selectSemstrList);
			
			List<LecScoreVO> lecScoreList = lecScoreList(user,lecScoreVO);
			model.addAttribute("lecScoreList", lecScoreList);
			view = "lms/grades";
		}
		
		return view;
	}
	
	@RequestMapping(value="/grades.do", method=RequestMethod.POST, produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public List<LecScoreVO> lecScoreList(
		@AuthenticationPrincipal(expression="realUser") UserLoginVO user
		, @ModelAttribute("search") LecScoreVO lecScoreVO
	) {
		lecScoreVO.setStdnt_no(user.getUser_id());
		ServiceResult result = lmsCommonService.selectLectureEvaluationCheck(user.getUser_id());
		List<LecScoreVO> lecScoreList = null;
		if(ServiceResult.OK.equals(result)) {
			lecScoreList = commonService.lecScoreList(lecScoreVO);
		}		
		return lecScoreList;
	}
	
	@RequestMapping(value="/statistics.do", method=RequestMethod.POST, produces=MediaType.APPLICATION_JSON_UTF8_VALUE )
	@ResponseBody
	public List<LecScoreVO> totalCredit(
		@AuthenticationPrincipal(expression="realUser") UserLoginVO user
		, @ModelAttribute("search") LecScoreVO lecScoreVO
	) {
		lecScoreVO.setStdnt_no(user.getUser_id());
		List<LecScoreVO> selectStatisticsList = commonService.selectStatisticsList(lecScoreVO);
		
		return selectStatisticsList;		
	}
}
