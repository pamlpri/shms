package kr.ac.shms.main.commuity.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.ac.shms.common.enumpkg.ServiceResult;
import kr.ac.shms.common.service.BoardService;

/**
 * @author 송수미
 * @since 2021. 5. 28.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 5. 28.      송수미       최초개정
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Controller
public class CollegeQnaDeleteController {
	
	private static final Logger logger = LoggerFactory.getLogger(CollegeQnaDeleteController.class);
	
	@Inject
	private BoardService boardService;
	
	@RequestMapping("/main/community/collegeQnaDelete.do")
	public String collegeQnaForm(
			@RequestParam("bo_no") String bo_no
			, RedirectAttributes session
			) {
		logger.info("bo_no : {}", bo_no);
		ServiceResult result = boardService.deleteBoard(Integer.parseInt(bo_no));
		
		String message = null;
		String view = null;
		
		if(ServiceResult.OK.equals(result)) {
			message = "게시글이 정상적으로 삭제되었습니다.";
			view = "redirect:/main/community/collegeQnaList.do";
		}else {
			message = "게시글 삭제 실패! 잠시 후에 다시 시도해주세요.";
			view = "redirect:/main/community/collegeQnaList.do?bo_no=" + bo_no;
		}
		session.addAttribute("message", message);
		
		logger.info("message : {}", message);
		return view;
	}
}
