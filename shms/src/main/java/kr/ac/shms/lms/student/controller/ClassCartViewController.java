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
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ac.shms.common.dao.OthersDAO;
import kr.ac.shms.common.vo.SearchVO;
import kr.ac.shms.common.vo.SubjectVO;
import kr.ac.shms.lms.login.vo.UserLoginVO;
import kr.ac.shms.lms.student.service.StudentService;
import kr.ac.shms.lms.student.vo.StudentVO;
import kr.ac.shms.lms.student.vo.SugangVO;

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
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */

@Controller
public class ClassCartViewController {
	private static final Logger logger = LoggerFactory.getLogger(ClassCartViewController.class);
	
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
	
	@RequestMapping("/lms/classCartInfo.do")
	public String classCartInfo (
		@AuthenticationPrincipal(expression="realUser") UserLoginVO user
		,@ModelAttribute("sugang") SugangVO sugangVO
		, Model model
	) {
		String user_id = user.getUser_id();
		StudentVO studentVO = studentService.student(user_id);
		
		model.addAttribute("student", studentVO);
		
		String sugang_at = "N";
		sugangVO.setSugang_at(sugang_at);
		sugangVO.setStdnt_no(user_id);
		SugangVO sugangReqIndexInfo = studentService.selectSugangReqInfo(sugangVO);
        model.addAttribute("sugangReqIndexInfo", sugangReqIndexInfo);
		
		return  "lms/classCartInfo";
	}
	
	@RequestMapping("/lms/classCart.do")
	public String classCart(
		@AuthenticationPrincipal(expression="realUser") UserLoginVO user
		,@ModelAttribute("sugang") SugangVO sugangVO
		, Model model
	) {
		addAttribute(model);
		
        String user_id = user.getUser_id();
        StudentVO studentVO = studentService.student(user_id);
        model.addAttribute("student", studentVO);
		
		SugangVO sugang = classCartForAjax(user, sugangVO, null, null, studentVO.getGrade(), null, null, null,studentVO.getGrade(), model);
		model.addAttribute("sugang", sugang);
		
		return  "lms/classCart";
	}
	
	@RequestMapping(value="/lms/classCart.do", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public SugangVO classCartForAjax(
		@AuthenticationPrincipal(expression="realUser") UserLoginVO user
		,@ModelAttribute("sugang") SugangVO sugangVO
		, @RequestParam(value="searchType", required=false) String searchType
		, @RequestParam(value="searchWord", required=false) String searchWord
		, @RequestParam(value="lec_atnlc", required=false) int lec_atnlc
		, @RequestParam(value="lec_cl_grp", required=false) String lec_cl_grp
		, @RequestParam(value="col_code", required=false) String col_code
		, @RequestParam(value="sub_code", required=false) String sub_code
		, @RequestParam(value="grade", required=false) int grade
		, Model model
	) {
		
		/** 파라미터 조회 */
		String userId = user.getUser_id();
		StudentVO studentVO = studentService.student(userId);
		String sugangAt = "N";
		
		sugangVO.setSugang_at(sugangAt);
		sugangVO.setStdnt_no(userId);
		
		/** 파라미터 검증 */

		/** 검색조건 */ 
		Map<String, Object> searchMap = new HashMap<>();
		searchMap.put("searchType", searchType);
		searchMap.put("searchWord", searchWord);
		searchMap.put("lec_atnlc", lec_atnlc);
		searchMap.put("lec_cl_grp", lec_cl_grp);
		searchMap.put("col_code", col_code);
		searchMap.put("sub_code", sub_code);
		searchMap.put("grade", grade);
		sugangVO.setSearchMap(searchMap);
		
		
		/** 서비스 호출 ***************************************************************************************/
		Map<String,Object> paramMap = new HashMap<>();
		paramMap.put("sugangVO", sugangVO);
		studentService.selectMainSuganList(paramMap);
		/*****************************************************************************************************/
		
		
		/** 자료구성 */
		model.addAttribute("subjectList", paramMap.get("subjectList"));
		model.addAttribute("collegeList", paramMap.get("collegeList"));
		model.addAttribute("cartList", paramMap.get("cartList"));
		model.addAttribute("student", studentVO);
		model.addAttribute("sugangReqIndexInfo", paramMap.get("sugangReqIndexInfo"));
		
		/** 반환 */ 
		addAttribute(model);
		
		return sugangVO;
	}
}
