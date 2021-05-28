package kr.ac.shms.main.commuity.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.ac.shms.main.commuity.service.BoardService;
import kr.ac.shms.main.commuity.vo.BoardVO;

@Controller
public class CollegeQnaDeleteController {
	
	private static final Logger logger = LoggerFactory.getLogger(CollegeQnaDeleteController.class);
	
	@Inject
	private BoardService boardService;
	
	@RequestMapping(value="/main/community/collegeQnaDelete.do", method=RequestMethod.POST)
	public String collegeQnaForm(
			@ModelAttribute("board") BoardVO board // validate해야하나?
			) {
		boolean authResult = boardService.boardAuth(board);
		String message = null;
		String view = null;
		
		if(authResult) {
			
		}else {
			message = "작성자명 또는 비밀번호가 틀렸습니다. 다시 입력해주세요";
			
		}
		return "main/community/collegeQnaForm";
	}
}
