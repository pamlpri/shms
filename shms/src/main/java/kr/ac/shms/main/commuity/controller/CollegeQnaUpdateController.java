package kr.ac.shms.main.commuity.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.ac.shms.common.enumpkg.ServiceResult;
import kr.ac.shms.common.service.BoardService;
import kr.ac.shms.common.vo.BoardVO;
import kr.ac.shms.validator.DMBoardUpdateGroup;

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
 * 2021. 5. 28.      송수미      	       학사문의 수정 기능 구현
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */

@Controller
public class CollegeQnaUpdateController {
	
	private static final Logger logger = LoggerFactory.getLogger(CollegeQnaUpdateController.class);
	
	@Inject
	private BoardService boardService;
	
	@RequestMapping(value="/main/community/collegeQnaUpdate.do")
	public String collegeQnaForm(
			@RequestParam("bo_no") int bo_no
			, Model model
			) {
		BoardVO saveBoard = boardService.selectBoard(bo_no);
		model.addAttribute("saveBoard", saveBoard);
		model.addAttribute("mode", "update");
		return "main/community/collegeQnaForm";
	}
	
	@RequestMapping(value="/main/community/collegeQnaUpdate.do", method=RequestMethod.POST)
	public String collegeQnaUpdate(
			@Validated(DMBoardUpdateGroup.class)
			@ModelAttribute("board") BoardVO board
			, Errors errors
			, Model model
			) {
		
		logger.info("board : {}", board.toString());
		boolean valid = !errors.hasErrors();
		
		BoardVO saveBoard = boardService.selectBoard(board.getBo_no());
		model.addAttribute("saveBoard", saveBoard);
		
		String view = null;
		String message = null;
		String bo_kind = boardService.selectBoKind("대학문의");
		
		if(valid) {
			board.setBo_kind(bo_kind);
			ServiceResult result = boardService.updateBoard(board);
			if(ServiceResult.OK.equals(result)) {
				view = "redirect:/main/community/collegeQnaList.do";
			}else if(ServiceResult.INVALIDPASSWORD.equals(result)) {
				message = "비밀번호가 올바르지 않습니다.";
				view = "main/community/collegeQnaForm";
			}else {
				message = "게시글 등록 실패! 잠시 후에 다시 시도해주세요.";
				view = "main/community/collegeQnaForm";
			}
			
		}else {
			message = "필수항목 누락";
			view = "main/community/collegeQnaForm";
		}
		model.addAttribute("message", message);
		model.addAttribute("mode", "update");
		
		return view;
	}
}
