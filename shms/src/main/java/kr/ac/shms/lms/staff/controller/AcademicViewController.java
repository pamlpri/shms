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
import kr.ac.shms.common.vo.AttachVO;
import kr.ac.shms.common.vo.BoardVO;
import kr.ac.shms.common.vo.PagingVO;
import kr.ac.shms.common.vo.RegInfoCngVO;
import kr.ac.shms.common.vo.StaffVO;
import kr.ac.shms.common.vo.SubjectVO;
import kr.ac.shms.lms.login.vo.UserLoginVO;
import kr.ac.shms.lms.staff.dao.LmsStaffDAO;
import kr.ac.shms.lms.staff.service.LmsStaffService;
import kr.ac.shms.lms.staff.vo.AcademicRegistrationVO;
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
@RequestMapping("/lms")
public class AcademicViewController {
	private static final Logger logger = LoggerFactory.getLogger(AcademicViewController.class);
	
	@Inject
	private LmsStaffService lmsStaffService;
	@Inject
	private StudentService studentService;
	@Inject
	private OthersDAO othersDAO;
	@Inject
	private LmsStaffDAO lmsStaffDAO;
	
	private void addAttribute(Model model) {
		List<Map<String, Object>> collegeList = othersDAO.selectCollegeList();
		List<SubjectVO> subjectList = othersDAO.selectSubjectList(null);
		List<Map<String, Object>> academicStatusList = othersDAO.selectAcademicStatusList();
		model.addAttribute("collegeList", collegeList);
		model.addAttribute("subjectList", subjectList);
		model.addAttribute("academicStatus", academicStatusList);
	}
	
	@RequestMapping("/academicList.do")
	public String academicList(
		@AuthenticationPrincipal(expression="realUser") UserLoginVO user
		, Model model
	) {
		String user_id = user.getUser_id();
		StaffVO staffVO = lmsStaffService.staff(user_id);
		List<MypageVO> studentList = studentService.studentSubList(staffVO);
		
		model.addAttribute("studentList", studentList);
		return  "lms/academicList";
	}
	
	@RequestMapping("/academicView.do")
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

	@RequestMapping(value="/academicDetailList.do")
	public String sendForm(
		@AuthenticationPrincipal(expression="realUser") UserLoginVO user	
		, @ModelAttribute("arvo") AcademicRegistrationVO arvo
		, @RequestParam(value="page", required=false, defaultValue="1") int currentPage
		, @RequestParam(value="searchWord", required=false) String searchWord
		, Model model
	) {
		model.addAttribute(academicDetailList(user, arvo, currentPage, searchWord, model));
		return "lms/academicDetailList";
	}
	
	@RequestMapping(value="/academicDetailList.do", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public PagingVO<AcademicRegistrationVO> academicDetailList(
		@AuthenticationPrincipal(expression="realUser") UserLoginVO user	
		, @ModelAttribute("arvo") AcademicRegistrationVO arvo
		, @RequestParam(value="page", required=false, defaultValue="1") int currentPage
		, @RequestParam(value="searchWord", required=false) String searchWord
		, Model model
	) {
		addAttribute(model);
		
		PagingVO<AcademicRegistrationVO> pagingVO = new PagingVO<>(10, 5);
		pagingVO.setCurrentPage(currentPage);
		
		Map<String, Object> searchMap = new HashMap<>();
		searchMap.put("col_code", arvo.getCol_code());
		searchMap.put("sub_code", arvo.getSub_code());
		searchMap.put("reginfo_stat", arvo.getReginfo_stat());
		searchMap.put("searchWord", searchWord);
		pagingVO.setSearchMap(searchMap);
		
		int totalRecord = lmsStaffService.selectAcademicRegistrationCount(pagingVO);
		pagingVO.setTotalRecord(totalRecord);
		
		List<AcademicRegistrationVO> arList = lmsStaffService.selectAcademicRegistrationList(pagingVO);
		pagingVO.setDataList(arList);
		
		return pagingVO;
	}
	
	@RequestMapping(value="/academicRegistrationExcelDownload.do")
	@ResponseBody
	public List<AcademicRegistrationVO> academicRegistrationExcelDownload() {
		return lmsStaffDAO.selectAcademicRegistrationInfo();
	}
	
}
