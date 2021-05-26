package kr.ac.shms.main.commuity.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.ac.shms.common.controller.IndexController;
import kr.ac.shms.main.commuity.service.BoardService;
import kr.ac.shms.main.commuity.vo.BoardVO;
import kr.ac.shms.main.commuity.vo.PagingVO;

/**
 * @author 박초원
 * @since 2021. 5. 20.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                  수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 5. 20.      박초원      	       최초작성
 * 2021. 5. 25.      송수미      	       학사공지 리스트 페이지 구현
 * 2021. 5. 26.      송수미      	       장학공지, 자료실, 대학문의 리스트 페이지 구현
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */

@Controller
public class NoticeViewController {
	
	private static final Logger logger = LoggerFactory.getLogger(IndexController.class);
	
	@Inject
	private BoardService service;
	
	private void setting(
			int currentPage
			, String searchType
			, String searchWord
			, Model model
			, String bo_name
			) {
		
		String bo_kind = service.selectBoKind(bo_name);
		
		PagingVO<BoardVO> pagingVO = new PagingVO<>(10, 5);
		pagingVO.setCurrentPage(currentPage);
		
		Map<String, Object> searchMap = new HashMap<>();
		searchMap.put("searchType", searchType);
		searchMap.put("searchWord", searchWord);
		searchMap.put("bo_kind", bo_kind);
		pagingVO.setSearchMap(searchMap);
		
		int totalRecord = service.selectBoardCount(pagingVO);
		pagingVO.setTotalRecord(totalRecord);
		
		List<BoardVO> boardList = service.selectBoardList(pagingVO);
		pagingVO.setDataList(boardList);
		model.addAttribute(pagingVO);
		
	}
	
	@RequestMapping("/main/community/academicList.do")
	public String academicList(
			@RequestParam(value="page", required=false, defaultValue="1") int currentPage
			, @RequestParam(value="searchType", required=false) String searchType
			, @RequestParam(value="searchWord", required=false) String searchWord
			, Model model
			) {
		String bo_name = "학사공지";
		setting(currentPage, searchType, searchWord, model, bo_name);
		return "main/community/academic";
	}
	
	@RequestMapping("/main/community/academicView.do")
	public String academicView() {
		return "main/community/academicView";
	}
	
	@RequestMapping("/main/community/regulations.do")
	public String regulations() {
		return "main/community/regulations";
	}
	
	@RequestMapping("/main/community/scholarshipList.do")
	public String scholarshipList(
			@RequestParam(value="page", required=false, defaultValue="1") int currentPage
			, @RequestParam(value="searchType", required=false) String searchType
			, @RequestParam(value="searchWord", required=false) String searchWord
			, Model model
			) {
		String bo_name = "장학공지";
		setting(currentPage, searchType, searchWord, model, bo_name);
		return "main/community/scholarship";
	}
	
	@RequestMapping("/main/community/scholarshipView.do")
	public String scholarshipView() {
		return "main/community/scholarshipView";
	}
	
	@RequestMapping("/main/community/scholarshipSystem.do")
	public String scholarshipSystem() {
		return "main/community/scholarshipSystem";
	}
	
	@RequestMapping("/main/community/referenceList.do")
	public String referenceList(
			@RequestParam(value="page", required=false, defaultValue="1") int currentPage
			, @RequestParam(value="searchType", required=false) String searchType
			, @RequestParam(value="searchWord", required=false) String searchWord
			, Model model
			) {
		String bo_name = "자료실";
		setting(currentPage, searchType, searchWord, model, bo_name);
		return "main/community/reference";
	}
	
}
