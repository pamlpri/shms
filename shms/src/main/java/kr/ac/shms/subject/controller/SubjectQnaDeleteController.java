package kr.ac.shms.subject.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.ac.shms.common.enumpkg.ServiceResult;
import kr.ac.shms.common.service.BoardService;
import kr.ac.shms.common.vo.BoardVO;

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
public class SubjectQnaDeleteController {
	@Inject
	private BoardService boardService;
	
	@RequestMapping("/subject/subjectQnaDelete.do")
	public String subjectQnaDelete(
			@RequestParam("bo_no") int bo_no
			, @SessionAttribute(name="sub_code", required=false) String sub_code
			, Model model
			, RedirectAttributes session
			) {
		
		BoardVO board = new BoardVO();
		board.setBo_no(bo_no);
		ServiceResult result = boardService.deleteBoard(board);
		
		String message = null;
		String view = null;
		
		if(ServiceResult.OK.equals(result)) {
			message = "게시글이 정상적으로 삭제되었습니다.";
			view = "redirect:/subject/subjectQnaList.do?sub_code=" + sub_code;
		}else {
			message = "게시글 삭제 실패! 잠시 후에 다시 시도해주세요.";
			view = "redirect:/subject/subjectQnaList.do?bo_no" + bo_no;
		}
		session.addAttribute("message", message);
		model.addAttribute("sub_code", sub_code);
		return view;
	}
}
