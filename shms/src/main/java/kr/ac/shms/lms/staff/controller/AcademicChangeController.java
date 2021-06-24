package kr.ac.shms.lms.staff.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ac.shms.common.dao.OthersDAO;
import kr.ac.shms.common.vo.PagingVO;
import kr.ac.shms.common.vo.RegInfoCngVO;
import kr.ac.shms.common.vo.SubjectVO;
import kr.ac.shms.lecture.controller.AttendanceAdminController;
import kr.ac.shms.lms.staff.service.LmsStaffService;
import kr.ac.shms.main.commuity.vo.ComCodeVO;

/**
 * @author 박초원
 * @since 2021. 6. 21.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일        수정자         수정내용
 * --------     --------    ----------------------
 * 2021. 6. 21.  박초원         최초작성
 * 2021. 6. 21.  김보미			학적변동 목록 조회
 * 2021. 6. 22.  김보미			페이징, 검색기능 추가
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Controller
public class AcademicChangeController {
	private static final Logger logger = LoggerFactory.getLogger(AttendanceAdminController.class);
	
	@Inject
	private LmsStaffService lmsStaffService;
	
	@Inject
	private OthersDAO othersDAO;
	
	private void addAttribute(Model model) {
		List<Map<String, Object>> collegeList = othersDAO.selectCollegeList();
		List<SubjectVO> subjectList = othersDAO.selectSubjectList(null);
		List<ComCodeVO> reqClList = lmsStaffService.selectReqClCode();
		model.addAttribute("collegeList", collegeList);
		model.addAttribute("subjectList", subjectList);
		model.addAttribute("reqClList", reqClList);
	}
	
	@RequestMapping("/lms/academicChange.do")
	public String academicChange(
		@ModelAttribute("cngVO") RegInfoCngVO cngVO
		, @RequestParam(value="page", required=false, defaultValue="1") int currentPage
		, @RequestParam(value="searchWord", required=false) String searchWord
		, Model model
		) {

		model.addAttribute(regInfoCngForAjax(cngVO, currentPage, searchWord, model));
		
		return "lms/academicChange";
	}
	
	
	@RequestMapping("/lms/academicChangeView.do")
	public String academicChangeView(
//		@RequestParam("cng_req_no") int cng_req_no
		) {
		
		return "lms/academicChangeView";
	}
	
	@RequestMapping(value="/lms/academicChange.do", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public PagingVO<RegInfoCngVO> regInfoCngForAjax(
		@ModelAttribute("cngVO") RegInfoCngVO cngVO
		, @RequestParam(value="page", required=false, defaultValue="1") int currentPage
		, @RequestParam(value="searchWord", required=false) String searchWord
		, Model model
		) {
		addAttribute(model);
		
		PagingVO<RegInfoCngVO> pagingVO = new PagingVO<>(10, 5);
		pagingVO.setCurrentPage(currentPage);
		
		Map<String, Object> searchMap = new HashMap<>();
		searchMap.put("col_code", cngVO.getCol_code());
		searchMap.put("sub_code", cngVO.getSub_code());
		searchMap.put("req_cl_code", cngVO.getReq_cl_code());
		searchMap.put("searchWord", searchWord);
		pagingVO.setSearchMap(searchMap);
		
		System.out.println("*************************************");
		logger.info("before pagingVO : {}", pagingVO );
		System.out.println("*************************************");
		
		int totalRecord = lmsStaffService.selectReginfoCngCount(pagingVO);
		pagingVO.setTotalRecord(totalRecord);
		
		System.out.println("*************************************");
		logger.info("pagingVO : {}", pagingVO );
		System.out.println("*************************************");
		List<RegInfoCngVO> regList = lmsStaffService.selectReginfoCngStudentList(pagingVO);
		pagingVO.setDataList(regList);
		
		return pagingVO;
	}
}