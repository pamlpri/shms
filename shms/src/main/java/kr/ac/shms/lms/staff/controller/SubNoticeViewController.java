package kr.ac.shms.lms.staff.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.ac.shms.common.dao.BoardDAO;
import kr.ac.shms.common.service.BoardService;
import kr.ac.shms.common.vo.AttachVO;
import kr.ac.shms.common.vo.BoardVO;
import kr.ac.shms.common.vo.StaffVO;
import kr.ac.shms.lms.login.vo.UserLoginVO;
import kr.ac.shms.lms.staff.service.LmsStaffService;

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
 * 2021. 6. 9.      송수미     	 	학과공지 조회 기능 구현
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Controller
public class SubNoticeViewController {
	private static final Logger logger = LoggerFactory.getLogger(SubNoticeViewController.class);
	
	@Inject
	private LmsStaffService lmsStaffService;
	
	@Inject
	private BoardService boardService;
	
	@RequestMapping("/lms/subjectNoticeList.do")
	public String subjectNoticeList(
		@AuthenticationPrincipal(expression="realUser") UserLoginVO user
		, Model model
	) {
		String user_id = user.getUser_id();
		StaffVO staffVO = lmsStaffService.staff(user_id);
		
		model.addAttribute("staff", staffVO);
		String sub_code = user.getSub_code();
		String bo_kind = boardService.selectBoKind("학과공지");
		Map<String, String> searchMap = new HashMap<>();
		searchMap.put("bo_kind", bo_kind);
		searchMap.put("sub_code", sub_code);
		
		List<BoardVO> boardList = boardService.selectAllBoardList(searchMap);
		model.addAttribute("boardList", boardList);
		
		return  "lms/subjectNoticeList";
	}
	
	@RequestMapping("/lms/subjectNoticeView.do")
	public String subjectNoticeView(
		@AuthenticationPrincipal(expression="realUser") UserLoginVO user
		, @RequestParam("bo_no") int bo_no
		, Model model
	) {
		
		BoardVO board = boardService.selectBoard(bo_no);
		logger.info("-------------------------------------------");
		logger.info("board : {}", board.toString());
		logger.info("attachList : {}", board.getAttachList());
		logger.info("-------------------------------------------");
		model.addAttribute("board", board);
		return  "lms/subjectNoticeView";
	}
	
	@RequestMapping(value="/boardDownload.do")
	public String downloader(
		@ModelAttribute("attach") AttachVO attach
		, Model model
	) {
		AttachVO attvo = boardService.download(attach);
		model.addAttribute("attvo", attvo);		
		return "downloadView";
	}
}
