package kr.ac.shms.main.commuity.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.ac.shms.lms.common.vo.PagingVO;
import kr.ac.shms.main.commuity.service.BoardService;
import kr.ac.shms.main.commuity.vo.BoardVO;

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
 * 2021. 5. 26.      송수미      	       대학문의 리스트 페이지 구현
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */

@Controller
@RequestMapping("/main/community")
public class CollegeQnaViewController {
	
	@Inject
	private BoardService boardService;
	
	private static final Logger logger = LoggerFactory.getLogger(CollegeQnaViewController.class);
	
	@RequestMapping("/collegeQnaList.do")
	public String collegeQnaList(
			@RequestParam(value="page", required=false, defaultValue="1") int currentPage
			, @RequestParam(value="searchType", required=false) String searchType
			, @RequestParam(value="searchWord", required=false) String searchWord
			, @RequestParam(value="inqry_kind", required=false) String inqry_kind
			, Model model
			) {
		String bo_name = "대학문의";
		String bo_kind = boardService.selectBoKind(bo_name);
		
		PagingVO<BoardVO> pagingVO = new PagingVO<>(10, 5);
		pagingVO.setCurrentPage(currentPage);
		
		Map<String, Object> searchMap = new HashMap<>();
		searchMap.put("searchType", searchType);
		searchMap.put("searchWord", searchWord);
		searchMap.put("bo_kind", bo_kind);
		searchMap.put("inqry_kind", inqry_kind);
		pagingVO.setSearchMap(searchMap);
		
		int totalRecord = boardService.selectBoardCount(pagingVO);
		pagingVO.setTotalRecord(totalRecord);
		
		List<BoardVO> boardList = boardService.selectBoardList(pagingVO);
		pagingVO.setDataList(boardList);
		model.addAttribute(pagingVO);
		
		return "main/community/collegeQna";
	}
	
	@RequestMapping("/collegeQnaView.do")
	public String collegeQnaView(
			@RequestParam("bo_no") int bo_no
			, Model model
			) {
		BoardVO board = boardService.selectBoard(bo_no);
		boardService.incrementHit(bo_no);
		
		model.addAttribute("board", board);
		return "main/community/collegeQnaView";
	}
}
