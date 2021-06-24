package kr.ac.shms.lms.staff.controller;

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
import kr.ac.shms.common.vo.PagingVO;
import kr.ac.shms.common.vo.SubjectVO;
import kr.ac.shms.lms.login.vo.UserLoginVO;
import kr.ac.shms.lms.staff.dao.LmsStaffDAO;
import kr.ac.shms.lms.staff.service.LmsStaffService;
import kr.ac.shms.lms.staff.vo.AcademicRegistrationVO;
import kr.ac.shms.lms.staff.vo.ApplicantVO;

/**
 * @author 박초원
 * @since 2021. 6. 24.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일        수정자         수정내용
 * --------     --------    ----------------------
 * 2021. 6. 24.  박초원         최초작성
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Controller
public class StudentRegisterController {
	private static final Logger logger = LoggerFactory.getLogger(StudentRegisterController.class);
	
	@Inject
	private LmsStaffService lmsStaffService;
	
	@Inject
	private OthersDAO othersDAO;
	
	private void addAttribute(Model model) {
		List<Map<String, Object>> collegeList = othersDAO.selectCollegeList();
		List<SubjectVO> subjectList = othersDAO.selectSubjectList(null);
		model.addAttribute("collegeList", collegeList);
		model.addAttribute("subjectList", subjectList);
	}
	
	@RequestMapping("/lms/studentRegister.do")
	public String studentRegister(
		@AuthenticationPrincipal(expression="realUser") UserLoginVO user
		, @RequestParam(value="searchType", required=false) String searchType
		, @RequestParam(value="searchWord", required=false) String searchWord
		, @RequestParam(value="col_code", required=false) String col_code
		, @RequestParam(value="sub_code", required=false) String sub_code
		, @RequestParam(value="page", required=false, defaultValue="1") int currentPage
		, Model model
	) {
		addAttribute(model);
		
		PagingVO<ApplicantVO> applicant = studentRegisterForAjax(user, searchType, searchWord, col_code, sub_code, currentPage, model);
		model.addAttribute("applicant", applicant);
		
		return "lms/studentRegister";
	}
	
	@RequestMapping(value="/lms/studentRegister.do", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public PagingVO<ApplicantVO> studentRegisterForAjax(
		@AuthenticationPrincipal(expression="realUser") UserLoginVO user
		, @RequestParam(value="searchType", required=false) String searchType
		, @RequestParam(value="searchWord", required=false) String searchWord
		, @RequestParam(value="col_code", required=false) String col_code
		, @RequestParam(value="sub_code", required=false) String sub_code
		, @RequestParam(value="page", required=false, defaultValue="1") int currentPage
		, Model model
	) {
		addAttribute(model);
		
		PagingVO<ApplicantVO> pagingVO = new PagingVO<>(10, 5);
		pagingVO.setCurrentPage(currentPage);
		
		Map<String, Object> searchMap = new HashMap<>();
		searchMap.put("searchType", searchType);
		searchMap.put("searchWord", searchWord);
		searchMap.put("col_code", col_code);
		searchMap.put("sub_code", sub_code);
		pagingVO.setSearchMap(searchMap);
		
		int totalRecord = lmsStaffService.selectFresherCount(pagingVO);
		pagingVO.setTotalRecord(totalRecord);
		
		List<ApplicantVO> dataList = lmsStaffService.selectFresherList(pagingVO);
		pagingVO.setDataList(dataList);
		
		return pagingVO;
	}
	
	@RequestMapping("/lms/fresherExcel.do")
	@ResponseBody
	public List<ApplicantVO> fresherExcel() {
		return lmsStaffService.selectFresherAllList();
	}
}
