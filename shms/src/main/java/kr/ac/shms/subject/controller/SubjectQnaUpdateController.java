package kr.ac.shms.subject.controller;

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
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import kr.ac.shms.common.enumpkg.ServiceResult;
import kr.ac.shms.common.service.BoardService;
import kr.ac.shms.common.vo.BoardVO;
import kr.ac.shms.main.commuity.controller.CollegeQnaUpdateController;
import kr.ac.shms.validator.BoardUpdateGroup;

/**
 * @author 김보미
 * @since 2021. 6. 5.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일        수정자        수정내용
 * --------     --------    ----------------------
 * 2021. 6. 5.   김보미        최초작성
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Controller
@SessionAttributes("sub_code")
public class SubjectQnaUpdateController {
	private static final Logger logger = LoggerFactory.getLogger(SubjectQnaUpdateController.class);
	
	@Inject
	private BoardService boardService;
	
	@RequestMapping("/subject/subjectQnaUpdate.do")
	public String subjectQnaUpdate(
			@RequestParam("bo_no") int bo_no
			, @SessionAttribute(name="sub_code", required=false) String sub_code
			, Model model
			) {
		BoardVO savedBoard = boardService.selectBoard(bo_no);
		model.addAttribute("savedBoard", savedBoard);
		model.addAttribute("mode", "update");
		model.addAttribute("sub_code", sub_code);
		return "subject/subjectQnaForm";
	}
	
	@RequestMapping(value="/subject/subjectQnaUpdate.do", method=RequestMethod.POST)
	public String subjectQnaUpdate(
			@Validated(BoardUpdateGroup.class)
			@ModelAttribute("board") BoardVO board
			, @SessionAttribute(name="sub_code", required=false) String sub_code
			, Errors errors
			, Model model
			) {
		logger.info("board : {}", board.toString());
		boolean valid = !errors.hasErrors();
		
		BoardVO savedBoard = boardService.selectBoard(board.getBo_no());
		model.addAttribute("savedboard", savedBoard);
		
		String view = null;
		String message = null;
		String bo_kind = boardService.selectBoKind("학과문의");
		
		if(valid) {
			board.setBo_kind(bo_kind);
			ServiceResult result = boardService.updateBoard(board);
			if(ServiceResult.OK.equals(result)) {
				view = "redirect:/subject/subjectQnaList.do?sub_code=" + sub_code;
			}else if(ServiceResult.INVALIDPASSWORD.equals(result)) {
				message = "비밀번호가 올바르지 않습니다.";
				view = "subject/subjectQnaForm";
			}
		}else {
			message = "필수항목 누락";
			view = "subject/subjectQnaForm";
		}
		model.addAttribute("message", message);
		model.addAttribute("mode", "update");
		model.addAttribute("sub_code", sub_code);
		
		return view;
	}
}


