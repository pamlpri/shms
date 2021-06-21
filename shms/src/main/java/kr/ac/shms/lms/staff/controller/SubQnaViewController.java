package kr.ac.shms.lms.staff.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ac.shms.common.enumpkg.ServiceResult;
import kr.ac.shms.common.service.BoardService;
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
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Controller
@RequestMapping("/lms")
public class SubQnaViewController {
	private static final Logger logger = LoggerFactory.getLogger(SubQnaViewController.class);
	
	@Inject
	private LmsStaffService lmsStaffService;
	@Inject
	private BoardService boardService;
	
	@RequestMapping("/subjectQnaList.do")
	public String subjectNoticeForm(
		@AuthenticationPrincipal(expression="realUser") UserLoginVO user
		, Model model
	) {
		List<BoardVO> boardList = boardService.subQnaBoardList();
		model.addAttribute("boardList", boardList);
		return  "lms/subjectQnaList";
	}
	
	@RequestMapping("/subjectQnaView.do")
	public String subjectQnaView(
		@AuthenticationPrincipal(expression="realUser") UserLoginVO user
		, @RequestParam("bo_no") String bo_no
		, Model model
	) {
		BoardVO boardVO = boardService.subQnaBoard(bo_no);
		model.addAttribute("board", boardVO);
		return  "lms/subjectQnaView";
	}
	
	@RequestMapping("/subQnaBoardAnsUpdate.do")
	public String subjectQnaAnsUpdate(
		@ModelAttribute("board") BoardVO boardVO
	) {
		logger.info("board : {} ", boardVO);
		ServiceResult result = boardService.qnaBoardAnsUpdate(boardVO);
		String view = null;
		if(ServiceResult.OK.equals(result)) {
			view = "redirect:/lms/subjectQnaList.do";
		}
		return view;
	}
	
	@RequestMapping("/subQnaBoardAnsDelete.do")
	@ResponseBody
	public ServiceResult subjectQnaAnsDelete(
		@RequestParam("bo_no") int bo_no
	) {
		ServiceResult result = boardService.subQnaBoardAnsDelete(bo_no);
		return result;
	}
}
