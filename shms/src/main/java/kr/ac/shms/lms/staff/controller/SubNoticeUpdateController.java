package kr.ac.shms.lms.staff.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
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
import kr.ac.shms.common.vo.StaffVO;
import kr.ac.shms.lms.login.vo.UserLoginVO;
import kr.ac.shms.lms.staff.service.LmsStaffService;
import kr.ac.shms.validator.BoardUpdateGroup;

/**
 * @author 송수미
 * @since 2021. 6. 9.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일           수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 6. 9.      송수미      	       최초작성
 * 2021. 6. 10.     송수미      	       게시글 수정 오류 수정
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Controller
public class SubNoticeUpdateController {
private static final Logger logger = LoggerFactory.getLogger(SubNoticeViewController.class);
	
	@Inject
	private LmsStaffService lmsStaffService;
	
	@Inject
	private BoardService boardService;
	
	@RequestMapping("/lms/subjectNoticeUpdate.do")
	public String subjectNoticeForm(
		@AuthenticationPrincipal(expression="realUser") UserLoginVO user
		, @RequestParam("bo_no") int bo_no
		, Model model
	) {
		BoardVO board = boardService.selectBoard(bo_no);
		
		String user_id = user.getUser_id();
		StaffVO staffVO = lmsStaffService.staff(user_id);
		
		model.addAttribute("staff", staffVO);
		model.addAttribute("board", board);
		
		return  "lms/subjectNoticeForm";
	}
	
	@RequestMapping(value="/lms/subjectNoticeUpdate.do", method=RequestMethod.POST)
	public String subjectNoticeUpdate(
			@AuthenticationPrincipal(expression="realUser") UserLoginVO user
			, @Validated(BoardUpdateGroup.class)
			@ModelAttribute("board") BoardVO board 
			, Errors errors
			, Model model
			) {
		
		String user_id = user.getUser_id();
		String user_name = user.getUser_name();
		StaffVO staffVO = lmsStaffService.staff(user_id);
		
		board.setBo_writer(user_name);
		String bo_kind = boardService.selectBoKind("학과공지");
		board.setBo_kind(bo_kind);
		
		boolean valid = !(errors.hasErrors());
		String message = null;
		String view = null;
		
		if(valid) {
			ServiceResult result = boardService.updateBoard(board);
			if(ServiceResult.OK.equals(result)) {
				view = "redirect:/lms/subjectNoticeView.do?bo_no=" + board.getBo_no();
			}else {
				message = "게시글 수정을 실패하였습니다. 잠시 후 다시 시도해주세요";
				view = "lms/subjectNoticeForm";
			}
		}else {
			message = "필수항목 누락";
			view = "lms/subjectNoticeForm";
		}		
		
		model.addAttribute("message", message);
		model.addAttribute("staff", staffVO);
		model.addAttribute("board", board);
		
		return  view;
	}
	
	
}
