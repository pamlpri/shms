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

import kr.ac.shms.common.enumpkg.ServiceResult;
import kr.ac.shms.common.service.BoardService;
import kr.ac.shms.common.vo.BoardVO;
import kr.ac.shms.common.vo.StaffVO;
import kr.ac.shms.lms.login.vo.UserLoginVO;
import kr.ac.shms.lms.staff.service.LmsStaffService;
import kr.ac.shms.validator.BoardInsertGroup;
/**
 * @author 박초원
 * @since 2021. 6. 8.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일           수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 6. 8.      박초원      	       최초작성
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Controller
public class SubNoticeInsertController {
	private static final Logger logger = LoggerFactory.getLogger(SubNoticeViewController.class);
	
	@Inject
	private LmsStaffService lmsStaffService;
	
	@Inject
	private BoardService boardService;
	
	@RequestMapping("/lms/subjectNoticeForm.do")
	public String subjectNoticeForm(
		@AuthenticationPrincipal(expression="realUser") UserLoginVO user
		, Model model
	) {
		String user_id = user.getUser_id();
		StaffVO staffVO = lmsStaffService.staff(user_id);
		
		model.addAttribute("staff", staffVO);
		return  "lms/subjectNoticeForm";
	}
	
	@RequestMapping(value="/lms/subjectNoticeForm.do", method=RequestMethod.POST)
	public String subjectNoticeForm(
			@AuthenticationPrincipal(expression="realUser") UserLoginVO user
			, @Validated(BoardInsertGroup.class)
			@ModelAttribute("board") BoardVO board 
			, Errors errors
			, Model model
			) {
		String user_id = user.getUser_id();
		StaffVO staffVO = lmsStaffService.staff(user_id);
		
		logger.info("board:{}", board);
		
		board.setBo_writer(user_id);
		String bo_kind = boardService.selectBoKind("학과공지");
		board.setBo_kind(bo_kind);
		String sub_code = user.getSub_code();
		board.setSub_code(sub_code);
		
		boolean valid = !(errors.hasErrors());
		String message = null;
		String view = null;
		
		if(valid) {
			ServiceResult result = boardService.insertBoard(board);
			if(ServiceResult.OK.equals(result)) {
				view = "redirect:/lms/subjectNoticeList.do";
			}else {
				message = "게시글 등록에 실패하였습니다. 잠시 후 다시 시도해주세요";
				view = "lms/subjectNoticeForm";
			}
		}else {
			message = "필수항목 누락";
			view = "lms/subjectNoticeForm";
		}
		
		logger.info("message : {}", message);
		model.addAttribute("message", message);
		model.addAttribute("staff", staffVO);
		return  view;
	}
}
