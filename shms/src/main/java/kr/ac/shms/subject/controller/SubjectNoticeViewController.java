package kr.ac.shms.subject.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import kr.ac.shms.common.service.BoardService;
import kr.ac.shms.common.vo.BoardVO;
import kr.ac.shms.lms.common.vo.PagingVO;

/**
 * @author 김보미
 * @since 2021. 6. 4.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일        수정자         수정내용
 * --------     --------    ----------------------
 * 2021. 6. 4.   김보미         최초작성
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Controller
@SessionAttributes("sub_code")
public class SubjectNoticeViewController {
	private static final Logger logger = LoggerFactory.getLogger(SubjectNoticeViewController.class);
	
	@Inject
	private BoardService boardService;
	
	@RequestMapping("/subject/subjectNoticeList.do")
	public String subjectNoticeList(
			@RequestParam(value="page", required=false, defaultValue="1") int currentPage
			, @RequestParam(value="searchType", required=false) String searchType
			, @RequestParam(value="searchWord", required=false) String searchWord
			, @SessionAttribute(name="sub_code", required=false) String sub_code
//			, SessionStatus sessionStatus
			, Model model
			) {
//		sessionStatus.setComplete();
		String bo_name = "학과공지";
		String bo_kind = boardService.selectBoKind(bo_name);
		
		PagingVO<BoardVO> pagingVO = new PagingVO<>(10, 5);
		pagingVO.setCurrentPage(currentPage);
		
		Map<String, Object> searchMap = new HashMap<>();
		searchMap.put("searchType", searchType);
		searchMap.put("searchWord", searchWord);
		searchMap.put("bo_kind", bo_kind);
		searchMap.put("sub_code", sub_code);
		pagingVO.setSearchMap(searchMap);
		int totalRecord = boardService.selectBoardCount(pagingVO);
		pagingVO.setTotalRecord(totalRecord);
		
		List<BoardVO> boardList = boardService.selectHGBoardList(pagingVO);
		pagingVO.setDataList(boardList);
		model.addAttribute(pagingVO);
		model.addAttribute("sub_code", sub_code);
		System.out.println("sub_code : " + sub_code);
		
		return "subject/subjectNotice";
	}
	
	@RequestMapping("/subject/subjectNoticeView.do")
	public String subjectNoticeView(
			@RequestParam("bo_no") int bo_no
			, @SessionAttribute(name="sub_code", required=false) String sub_code
			, Model model
			) {
		BoardVO board = boardService.selectBoard(bo_no);
		
		model.addAttribute("board", board);
		model.addAttribute("sub_code", sub_code);
		return "subject/subjectNoticeView";
	}
	
}

