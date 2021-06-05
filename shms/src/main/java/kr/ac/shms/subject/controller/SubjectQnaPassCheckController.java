package kr.ac.shms.subject.controller;

import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import kr.ac.shms.common.service.BoardService;
import kr.ac.shms.common.vo.BoardVO;

/**
 * @author 김보미
 * @since 2021. 6. 5.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일         수정자      수정내용
 * --------     --------    ----------------------
 * 2021. 6. 5.    김보미       최초작성
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Controller
@SessionAttributes("sub_code")
public class SubjectQnaPassCheckController {
	@Inject
	private BoardService boardService;
	
	@RequestMapping("/subject/subjectQnaPass.do")
	public String subjectQnaPassCheckForm(
			@RequestParam("bo_no") int bo_no
			, @SessionAttribute(name="sub_code", required=false) String sub_code
			, Model model
			) {
		model.addAttribute("bo_no", bo_no);
		model.addAttribute("sub_code", sub_code);
		return "subject/subjectQnaPass";
	}
	
	@RequestMapping(value="/subject/subjectQnaPass.do", method=RequestMethod.POST, produces=MediaType.APPLICATION_JSON_UTF8_VALUE)	
	@ResponseBody
	public boolean subjectQnaPassCheck(
			@RequestBody Map<String, String> boardMap
			, @SessionAttribute(name="sub_code", required=false) String sub_code
			, Model model
			) {
		BoardVO board = new BoardVO();
		board.setBo_no(Integer.parseInt(boardMap.get("bo_no")));
		board.setBo_writer(boardMap.get("bo_writer"));
		board.setBo_password(boardMap.get("bo_password"));
		
		boolean result = boardService.boardAuth(board);
		model.addAttribute("sub_code", sub_code);
		
		return result;
	}
}







