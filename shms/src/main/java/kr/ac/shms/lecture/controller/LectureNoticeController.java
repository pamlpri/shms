package kr.ac.shms.lecture.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.ac.shms.common.enumpkg.ServiceResult;
import kr.ac.shms.common.service.BoardService;
import kr.ac.shms.common.service.CommonAttachService;
import kr.ac.shms.common.vo.AttachVO;
import kr.ac.shms.common.vo.BoardVO;
import kr.ac.shms.lms.login.vo.UserLoginVO;
import kr.ac.shms.validator.BoardInsertGroup;

/**
 * @author 박초원
 * @since 2021. 6. 11.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                  수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 6. 11.      박초원      	       최초작성
 * 2021. 6. 20.      송수미      	       강의 공지사항 조회, 등록, 수정, 삭제 기능 구현
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Controller
public class LectureNoticeController {
	private static final Logger logger = LoggerFactory.getLogger(LectureNoticeController.class);
	
	@Inject
	private BoardService boardService;
	@Inject
	private CommonAttachService commonAttachService;
	
	@RequestMapping("/lecture/notice.do")
	public String notice(
		@SessionAttribute(name="lec_code", required=false) String lec_code
		, Model model
	) {
		Map<String, String> searchMap = new HashMap<>();
		searchMap.put("bo_kind", "GG");
		searchMap.put("lec_code", lec_code);
		
		List<BoardVO> boardList = boardService.selectAllBoardList(searchMap);
		
		model.addAttribute("boardList", boardList);
		
		return "lecture/notice";
	}
	
	@RequestMapping("/lecture/noticeView.do")
	public String noticeView(
		@SessionAttribute(name="lec_code", required=false) String lec_code
		, @RequestParam("bo_no") int bo_no
		, Model model
	) {
		BoardVO board = boardService.selectBoard(bo_no);
		
		model.addAttribute("board", board);
		
		return "lecture/noticeView";
	}
	
	@RequestMapping("/lecture/noticeInsert.do")
	public String noticeForm(
			@SessionAttribute(name="lec_code", required=false) String lec_code
			, Model model
		) {
		
		return "lecture/noticeForm";
	}
	
	@RequestMapping(value="/lecture/noticeInsert.do", method=RequestMethod.POST)
	public String noticeInsert(
			@AuthenticationPrincipal(expression="realUser") UserLoginVO user
			, @SessionAttribute(name="lec_code", required=false) String lec_code
			, @Validated(BoardInsertGroup.class)
			@ModelAttribute("board") BoardVO board
			, Errors errors 
			, Model model
			) {
		
		/** 파라미터 조회 */
		board.setLec_code(lec_code);
		board.setBo_writer(user.getUser_name());
		board.setBo_kind("GG");
		
		/** 파라미터 검증 */
		boolean valid = !(errors.hasErrors());
		String message = null;
		String view = null;
		
		if(valid) {
			ServiceResult result = boardService.insertBoard(board);
			
			if(ServiceResult.OK.equals(result)) {
				view = "redirect:/lecture/notice.do";
			}else {
				message = "게시글 등록에 실패하였습니다. 잠시 후 다시 시도해주세요.";
				view = "lecture/noticeForm";
			}
		}else {
			message = "필수항목 누락";
			view = "lecture/noticeForm";
		}
		
		model.addAttribute("message", message);
		model.addAttribute("board", board);

		return view;
	}
	
	@RequestMapping(value="/lecture/GGDownload.do")
	public String downloader(
		@ModelAttribute("attach") AttachVO attach
		, Model model
	) {
		AttachVO attvo = commonAttachService.download(attach, null);
		model.addAttribute("attvo", attvo);		
		return "downloadView";
	}
	
	@RequestMapping("/lecture/noticeUpdate.do")
	public String noticeUpdateForm(
		@AuthenticationPrincipal(expression="realUser") UserLoginVO user
		, @RequestParam("bo_no") int bo_no
		, Model model
		) {
		BoardVO board = boardService.selectBoard(bo_no);
		
		model.addAttribute("board", board);
		
		return "lecture/noticeForm";
	}
	
	@RequestMapping(value="/lecture/noticeUpdate.do", method=RequestMethod.POST)
	public String noticeUpdate(
			@AuthenticationPrincipal(expression="realUser") UserLoginVO user
			, @SessionAttribute(name="lec_code", required=false) String lec_code
			, @Validated(BoardInsertGroup.class)
			@ModelAttribute("board") BoardVO board
			, Errors errors 
			, Model model
			) {
		/** 파라미터 조회 */
		board.setBo_kind("GG");
		board.setLec_code(lec_code);
		board.setBo_writer(user.getUser_name());
		
		/** 파라미터 검증 */
		boolean valid = !(errors.hasErrors());
		String message = null;
		String view = null;
		
		if(valid) {
			ServiceResult result = boardService.updateBoard(board);
			
			if(ServiceResult.OK.equals(result)) {
				view = "redirect:/lecture/notice.do?lec_code=" + lec_code;
			}else {
				message = "게시글 등록에 실패하였습니다. 잠시 후 다시 시도해주세요.";
				view = "lecture/noticeForm";				
			}
		}else {
			message = "필수항목 누락";
			view = "lecture/noticeForm";
		}
		
		model.addAttribute("message", message);
		model.addAttribute("board", board);

		return view;
	}
	
	@RequestMapping(value="/lecture/noticeDelete.do", method=RequestMethod.POST)
	public String noticeDelete(
		@ModelAttribute("board") BoardVO board
		, @SessionAttribute(name="lec_code", required=false) String lec_code
		, RedirectAttributes session
		) {
		board.setLec_code(lec_code);
		board.setBo_kind("GG");
		
		ServiceResult result = ServiceResult.FAIL;
		String message = null;
		String view = null;
		result = boardService.deleteBoard(board);
		
		if(ServiceResult.OK.equals(result)) {
			view = "redirect:/lecture/notice.do";
		}else if(ServiceResult.NOTEXIST.equals(result)){
			view = "redirect:/lecture/notice.do";
		}else {
			message = "게시글 삭제에 실패하였습니다. 잠시 후 다시 시도해주세요";
			view = "redirect:/lms/subjectNoticeView.do?bo_no=" + board.getBo_no();
		}
		
		session.addFlashAttribute("message", message);
		return view;
	}
}
