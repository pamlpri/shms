package kr.ac.shms.subject.controller;

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
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import kr.ac.shms.common.service.BoardService;
import kr.ac.shms.common.vo.BoardVO;
import kr.ac.shms.lms.common.vo.PagingVO;
import kr.ac.shms.subject.service.SubjectService;
import kr.ac.shms.subject.vo.SubjectVO;

/**
 * @author 김보미
 * @since 2021. 6. 4.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일        수정자      수정내용
 * --------     --------  ----------------------
 * 2021. 6. 4.   김보미      최초작성
 * 2021. 6. 5.   김보미		 문의글 조회 구현				 		
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Controller
@SessionAttributes("sub_code")
public class SubjectQnaViewController {
	private static final Logger looger = LoggerFactory.getLogger(SubjectQnaViewController.class);
	
	@Inject
	private BoardService boardSerivce;
	
	
	@RequestMapping("/subject/subjectQnaList.do")
	public String subjectQnaList(
			@RequestParam(value="page", required=false, defaultValue="1") int currentPage
			, @RequestParam(value="searchType", required=false) String searchType
			, @RequestParam(value="searchWord", required=false) String searchWord 
//			, @RequestParam(value="sub_code") String sub_code
			, @SessionAttribute(name="sub_code", required=false) String sub_code
			, Model model
			) {
		String bo_name = "학과문의";
		String bo_kind = boardSerivce.selectBoKind(bo_name);
		
		PagingVO<BoardVO> pagingVO = new PagingVO<>(10, 5);
		pagingVO.setCurrentPage(currentPage);
		
		Map<String, Object> searchMap = new HashMap<>();
		searchMap.put("searchType", searchType);
		searchMap.put("searchWord", searchWord);
		searchMap.put("bo_kind", bo_kind);
		searchMap.put("sub_code", sub_code);
		pagingVO.setSearchMap(searchMap);
		
		int totalRecord = boardSerivce.selectBoardCount(pagingVO);
		pagingVO.setTotalRecord(totalRecord);
		
		List<BoardVO> boardList = boardSerivce.selectHGBoardList(pagingVO);
		pagingVO.setDataList(boardList);
		model.addAttribute(pagingVO);
		model.addAttribute("sub_code", sub_code);
		
		return "subject/subjectQna";
	}
	
	@RequestMapping("/subject/subjectQnaView.do")
	public String subjectQnaView(
			@RequestParam("bo_no") int bo_no
//			, @RequestParam("sub_code") String sub_code
			, @SessionAttribute(name="sub_code", required=false) String sub_code
			, Model model			
			) {
		BoardVO board = boardSerivce.selectBoard(bo_no);
		
		model.addAttribute("board", board);
		model.addAttribute("sub_code", sub_code);
		return "subject/subjectQnaView";
	}
}
