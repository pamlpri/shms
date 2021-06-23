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
		model.addAttribute("collegeList", collegeList);
		model.addAttribute("subjectList", subjectList);
	}
	
	@RequestMapping("/lms/academicChange.do")
	public String academicChange(
		@RequestParam(value="page", required=false, defaultValue="1") int currentPage
		, @RequestParam(value="searchType", required=false) String searchType
		, @RequestParam(value="searchWord", required=false) String searchWord
		, @ModelAttribute("cngVO") RegInfoCngVO cngVO
		, Model model
		) {
		addAttribute(model);

		List<ComCodeVO>  comcodeList = lmsStaffService.selectReqClCode();
		RegInfoCngVO cng = regInfoCngForAjax(currentPage, cngVO, searchType, searchWord, null, null, null, model);
		model.addAttribute("comcodeList", comcodeList);
		return "lms/academicChange";
	}
	
	@RequestMapping("/lms/academicChangeView.do")
	public String academicChangeView() {
		return "lms/academicChangeView";
	}
	
	@RequestMapping(value="/lms/academicChange.do", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public RegInfoCngVO regInfoCngForAjax(
		@RequestParam(value="page", required=false, defaultValue="1") int currentPage
		, @ModelAttribute("regInfo") RegInfoCngVO cngVO
		, @RequestParam(value="searchType", required=false) String searchType
		, @RequestParam(value="searchWord", required=false) String searchWord
		, @RequestParam(value="col_code", required=false) String col_code
		, @RequestParam(value="sub_code", required=false) String sub_code
		, @RequestParam(value="req_cl_code", required=false) String req_cl_code
		, Model model
		) {
		
		/** 파라미터 조회*******************************************************/
		/** 검색 조건***********************************************************/
		
		PagingVO<RegInfoCngVO> pagingVO = new PagingVO<>(10, 5);
		pagingVO.setCurrentPage(currentPage);
		
		Map<String, Object> searchMap = new HashMap<>();
		searchMap.put("searchTyp", searchType);
		searchMap.put("searchWord", searchWord);
		pagingVO.setSearchMap(searchMap);
		
		int totalRecord = lmsStaffService.selectReginfoCngCount(pagingVO);
		pagingVO.setTotalRecord(totalRecord);
		
		
		List<RegInfoCngVO> cngList = lmsStaffService.selectReginfoCngStudentList(pagingVO);
		pagingVO.setDataList(cngList);
		model.addAttribute(pagingVO);
		model.addAttribute("cngList", cngList);
		
		return null;
	}
}
