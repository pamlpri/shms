package kr.ac.shms.lms.staff.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.ac.shms.common.enumpkg.ServiceResult;
import kr.ac.shms.common.service.BoardService;
import kr.ac.shms.lms.staff.service.LmsStaffService;

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
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Controller
public class SubNoticeDeleteController {
	private static final Logger logger = LoggerFactory.getLogger(SubNoticeViewController.class);
	
	@Inject
	private LmsStaffService lmsStaffService;
	
	@Inject
	private BoardService boardService;
	
	@RequestMapping("/lms/subjectNoticeDelete.do")
	public String subjectNoticeDelete(
			@Validated
			@RequestParam("bo_no") int bo_no
			, Errors errors
			) {
		
		ServiceResult result = ServiceResult.FAIL;
		boolean valid = !(errors.hasErrors());
		String message = null;
		String view = null;
		
		if(valid) {
			result = boardService.deleteBoard(bo_no);
			if(ServiceResult.OK.equals(result)) {
				view = "redirect:/lms/subjectNoticeList.do";
			}else {
				message = "게시글 삭제에 실패하였습니다. 잠시 후 다시 시도해주세요";
				view = "redirect:/lms/subjectNoticeView.do?bo_no=" + bo_no;
			}
		}else {
			message = "존재하지 않는 게시물입니다.";
		}
		
		
		return null;
	}
}
