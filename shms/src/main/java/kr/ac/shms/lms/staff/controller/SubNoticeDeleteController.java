package kr.ac.shms.lms.staff.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.ac.shms.common.enumpkg.ServiceResult;
import kr.ac.shms.common.service.BoardService;
import kr.ac.shms.common.vo.BoardVO;

/**
 * @author 송수미
 * @since 2021. 6. 9.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일           수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 6. 09.      송수미      	       최초작성
 * 2021. 6. 10.      송수미      	       게시글 삭제 오류 수정
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Controller
public class SubNoticeDeleteController {
	private static final Logger logger = LoggerFactory.getLogger(SubNoticeViewController.class);
	
	@Inject
	private BoardService boardService;
	
	@RequestMapping(value="/lms/subjectNoticeDelete.do", method=RequestMethod.POST)
	public String subjectNoticeDelete(
			@ModelAttribute("board") BoardVO board
			, RedirectAttributes session
			) {
		
		ServiceResult result = ServiceResult.FAIL;
		String message = null;
		String view = null;
		result = boardService.deleteBoard(board);
		
		if(ServiceResult.OK.equals(result)) {
			view = "redirect:/lms/subjectNoticeList.do";
		}else if(ServiceResult.NOTEXIST.equals(result)){
			message = "존재하지 않는 게시글입니다.";
			view = "redirect:/lms/subjectNoticeView.do?bo_no=" + board.getBo_no();
		}else {
			message = "게시글 삭제에 실패하였습니다. 잠시 후 다시 시도해주세요";
			view = "redirect:/lms/subjectNoticeView.do?bo_no=" + board.getBo_no();
		}
		
		session.addFlashAttribute("message", message);
		return view;
	}
}
