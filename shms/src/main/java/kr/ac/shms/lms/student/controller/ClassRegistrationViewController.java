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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ac.shms.common.dao.OthersDAO;
import kr.ac.shms.common.vo.SubjectVO;
import kr.ac.shms.lms.login.vo.UserLoginVO;
import kr.ac.shms.lms.student.service.StudentService;
import kr.ac.shms.lms.student.vo.StudentVO;
import kr.ac.shms.lms.student.vo.SugangVO;
import kr.ac.shms.lms.student.vo.TimeTableVO;

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
 * 2021. 6. 5.      송수미      		수강신청 인덱스 페이지 구현
 * 2021. 6. 8.      박초원              수강신청과목 검색, 조회
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */

@Controller
public class ClassRegistrationViewController {
	private static final Logger logger = LoggerFactory.getLogger(ClassRegistrationViewController.class);
	
	@Inject
	private StudentService studentService;
	
	@Inject
	private OthersDAO othersDAO;
	
	private void addAttribute(Model model) {
		List<Map<String, Object>> collegeList = othersDAO.selectCollegeList();
		List<SubjectVO> subjectList = othersDAO.selectSubjectList(null);
		model.addAttribute("collegeList", collegeList);
		model.addAttribute("subjectList", subjectList);
	}
	
	@RequestMapping("/lms/classRegistrationInfo.do")
	public String classRegistrationInfo (
		@AuthenticationPrincipal(expression="realUser") UserLoginVO user
		,@ModelAttribute("sugang") SugangVO sugangVO
		, Model model
	) {
		String user_id = user.getUser_id();
		StudentVO studentVO = studentService.student(user_id);
		
		model.addAttribute("student", studentVO);
		
		String sugang_at = "Y";
		sugangVO.setSugang_at(sugang_at);
		sugangVO.setStdnt_no(user_id);
		SugangVO sugangReqIndexInfo = studentService.selectSugangReqInfo(sugangVO);
		model.addAttribute("sugangReqIndexInfo", sugangReqIndexInfo);
		
		return  "lms/classRegistrationInfo";
	}
	

	@RequestMapping("/lms/classRegistration.do")
	public String classRegistration(
		@AuthenticationPrincipal(expression="realUser") UserLoginVO user
		,@ModelAttribute("sugang") SugangVO sugangVO
		, Model model
	) {
		addAttribute(model);
		
        String user_id = user.getUser_id();
        StudentVO studentVO = studentService.student(user_id);
        model.addAttribute("student", studentVO);
		
		SugangVO sugang = classRegistrationForAjax(user, sugangVO, null, null, studentVO.getGrade(), null, null, null, studentVO.getGrade(), model);
		model.addAttribute("sugang", sugang);
		
		return  "lms/classRegistration";
	}
	
	@RequestMapping(value="/lms/classRegistration.do", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public SugangVO classRegistrationForAjax(
		@AuthenticationPrincipal(expression="realUser") UserLoginVO user
		, @ModelAttribute("sugang") SugangVO sugangVO
		, @RequestParam(value="searchType", required=false) String searchType
		, @RequestParam(value="searchWord", required=false) String searchWord
		, @RequestParam(value="lec_atnlc", required=false) int lec_atnlc
		, @RequestParam(value="lec_cl_grp", required=false) String lec_cl_grp
		, @RequestParam(value="col_code", required=false) String col_code
		, @RequestParam(value="sub_code", required=false) String sub_code
		, @RequestParam(value="grade", required=false) int grade
		, Model model	
	) {
		addAttribute(model);
		
		String user_id = user.getUser_id();
		StudentVO studentVO = studentService.student(user_id);
		model.addAttribute("student", studentVO);
		
		Map<String, Object> searchMap = new HashMap<>();
		searchMap.put("searchType", searchType);
		searchMap.put("searchWord", searchWord);
		searchMap.put("lec_atnlc", lec_atnlc);
		searchMap.put("lec_cl_grp", lec_cl_grp);
		searchMap.put("col_code", col_code);
		searchMap.put("sub_code", sub_code);
		searchMap.put("grade", grade);
		sugangVO.setSearchMap(searchMap);
		
		if(lec_cl_grp != null && lec_cl_grp.equals("cart")) {
			List<SugangVO> cartList = studentService.selectCartList(user_id);
			sugangVO.setDataList(cartList);
		}else {
			List<SugangVO> dataList = studentService.selectSugangList(sugangVO);
			sugangVO.setDataList(dataList);
		}
		
		List<SugangVO> sugangList = studentService.selectRegistrationList(user_id);
		model.addAttribute("sugangList", sugangList);
		
		String sugang_at = "Y";
		sugangVO.setSugang_at(sugang_at);
		sugangVO.setStdnt_no(user_id);
        SugangVO sugangReqIndexInfo = studentService.selectSugangReqInfo(sugangVO);
        model.addAttribute("sugangReqIndexInfo", sugangReqIndexInfo);
		
		return sugangVO;
	}
	
	@RequestMapping("/lms/sugangTimeTable.do")
	public String sugangTimeTable(
		@AuthenticationPrincipal(expression="realUser") UserLoginVO user
		, Model model
	) {
		String stdnt_no = user.getUser_id();
		StudentVO studentVO = studentService.student(stdnt_no);
		List<TimeTableVO> timeTableList = studentService.timeTable(stdnt_no);
		
		model.addAttribute("student", studentVO);
		model.addAttribute("timeTableList", timeTableList);
		
		return "/lms/sugangTimeTable";
	}
}