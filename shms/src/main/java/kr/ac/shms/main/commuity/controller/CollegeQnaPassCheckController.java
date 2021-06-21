package kr.ac.shms.main.commuity.controller;

import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ac.shms.common.service.BoardService;
import kr.ac.shms.common.vo.BoardVO;

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
 * 2021. 5. 27.      송수미      	       비밀번호 체크 기능 구현
 * 2021. 5. 29.      송수미      	       비밀번호 체크 기능 비동기 방식으로 개정
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */

@Controller
public class CollegeQnaPassCheckController {
	
	@Inject
	private BoardService boardService;
	
	private static final Logger logger = LoggerFactory.getLogger(CollegeQnaPassCheckController.class);
	
	@RequestMapping("/main/community/collegeQnaPass.do")
	public String collegeQnaPassCheckForm(
			@RequestParam("bo_no") int bo_no
			, Model model
			) {
		
		model.addAttribute("bo_no", bo_no);
		return "main/community/collegeQnaPass";
	}
	
	@RequestMapping(value="/main/community/collegeQnaPass.do", method=RequestMethod.POST, produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public boolean collegeQnaPassCheck(
			@RequestBody Map<String, String> boardMap
			) {
		
		BoardVO board = new BoardVO();
		
		board.setBo_no(Integer.parseInt(boardMap.get("bo_no")));
		board.setBo_writer(boardMap.get("bo_writer"));
		board.setBo_password(boardMap.get("bo_password"));
		
		boolean result = boardService.boardAuth(board);
		
		return result;
	}
	
}
