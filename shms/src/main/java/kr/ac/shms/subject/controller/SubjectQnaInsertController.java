package kr.ac.shms.subject.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import kr.ac.shms.common.enumpkg.ServiceResult;
import kr.ac.shms.common.service.BoardService;
import kr.ac.shms.common.vo.BoardVO;
import kr.ac.shms.validator.HMBoardInsertGroup;

/**
 * @author 김보미
 * @since 2021. 6. 5.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일        수정자       수정내용
 * --------     --------    ----------------------
 * 2021. 6. 5.   김보미       최초작성
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Controller
@SessionAttributes("sub_code")
public class SubjectQnaInsertController {
	@Inject
	private BoardService boardService;
	
	@RequestMapping(("/subejct/subjectQnaInsert.do"))
	public String subjectQnaForm(
//			@RequestParam(value="sub_code") String sub_code
			@SessionAttribute(name="sub_code", required=false) String sub_code
			, Model model
			) {
		model.addAttribute("sub_code", sub_code);
		return "subject/subjectQnaForm";
	}
	
	@RequestMapping(value="/subejct/subjectQnaInsert.do", method=RequestMethod.POST)
	public String subjectQnaFormInsert(
			@Validated(HMBoardInsertGroup.class)
			@ModelAttribute("board") BoardVO board
//			, @RequestParam(value="sub_code") String sub_code
			, @SessionAttribute(name="sub_code", required=false) String sub_code
			, Errors errors
			, Model model
			) {
		boolean valid = !errors.hasErrors();
		
		String view = null;
		String message = null;
		String bo_kind = boardService.selectBoKind("학과문의");
		String bo_cont = board.getBo_cont().replaceAll("\r\n", "<br/>");
		board.setBo_cont(bo_cont);
		
		if(valid) {
			board.setBo_kind(bo_kind);
			board.setSub_code(sub_code);
			ServiceResult result = boardService.insertBoard(board);
			if(ServiceResult.OK.equals(result)) {
				view = "redirect:/subject/subjectQnaList.do";
			}else {
				message = "게시글 등록 실패! 잠시 후에 다시 시도해주세요.";
				view = "subject/subjectQnaForm";
			}
		}else {
			message = "필수항목 누락";
			view = "subject/subjectQnaForm";
		}
		model.addAttribute("message", message);
		model.addAttribute("sub_code", sub_code);
		return view;
	}	

}


