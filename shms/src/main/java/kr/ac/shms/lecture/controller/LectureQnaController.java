package kr.ac.shms.lecture.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.ac.shms.common.enumpkg.ServiceResult;
import kr.ac.shms.common.service.BoardService;
import kr.ac.shms.common.vo.BoardVO;
import kr.ac.shms.lms.login.vo.UserLoginVO;
import kr.ac.shms.validator.AnsBoardUpdateGroup;
import kr.ac.shms.validator.BoardDeleteGroup;
import kr.ac.shms.validator.GMBoardInsertGroup;
import kr.ac.shms.validator.GMBoardUpdateGroup;

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
 * 2021. 6. 21.      송수미      	       강의 문의 조회, 등록, 수정, 삭제 기능 구현
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Controller
@SessionAttributes({"lec_code", "authMap"})
public class LectureQnaController {
	private static final Logger logger = LoggerFactory.getLogger(LectureNoticeController.class);
	
	@Inject
	private BoardService boardService;
	
	@RequestMapping("/lecture/qna.do")
	public String qna(
		@AuthenticationPrincipal(expression="realUser") UserLoginVO user	
		, @SessionAttribute(name="lec_code", required=false) String lec_code
		, Model model
	) {
		Map<String, String> searchMap = new HashMap<>();
		searchMap.put("bo_kind", "GM");
		searchMap.put("lec_code", lec_code);
		
		List<BoardVO> boardList = boardService.selectAllBoardList(searchMap);
		
		model.addAttribute("boardList", boardList);
		
		return "lecture/qna";
	}
	
	@RequestMapping("/lecture/password.do")
	public String passwordForm(
		@SessionAttribute(name="lec_code", required=false) String lec_code
		, @RequestParam("bo_no") int bo_no
		, Model model
	) {
		
		model.addAttribute("bo_no", bo_no);
		return "lecture/password";
	} 
	
	@RequestMapping(value="/lecture/password.do", method=RequestMethod.POST)
	public String passwordCheck(
			@SessionAttribute(name="lec_code", required=false) String lec_code
			, @AuthenticationPrincipal(expression="realUser") UserLoginVO user
			, @RequestParam("bo_no") int bo_no
			, @RequestParam("bo_password") String bo_password
			, RedirectAttributes session
			, Model model
			) {
		logger.info("bo_password : {}", bo_password);
		BoardVO savedBoard = boardService.selectBoard(bo_no);
		BoardVO board = new BoardVO();
		board.setBo_no(bo_no);
		board.setBo_password(bo_password);
		Map<String, Object> authMap = new HashMap<>();
		authMap.put("bo_no", bo_no);
		authMap.put("user_id", user.getUser_id());
		
		boolean result = false;
		String view = null;
		String message = null;
		
		if(StringUtils.isBlank(bo_password)) {
			message = "비밀번호를 입력해주세요.";
			view = "redirect:/lecture/password.do?bo_no=" + bo_no;
		}else if(!user.getUser_id().equals(savedBoard.getBo_writer())){
			message = "비밀글은 작성자 본인만 열람 가능합니다.";
			view = "redirect:/lecture/qna.do";
		}else {
			result = boardService.boardAuth(board);
			
			if(result) {
				model.addAttribute("authMap", authMap);
				view = "redirect:/lecture/qnaView.do?bo_no=" + bo_no;
			}else {
				message = "비밀번호가 올바르지 않습니다.";
				view = "redirect:/lecture/password.do?bo_no=" + bo_no;
			}
		}
		session.addFlashAttribute("message", message);
		
		return view;
	} 
	
	@RequestMapping("/lecture/qnaView.do")
	public String qnaView(
		@AuthenticationPrincipal(expression="realUser") UserLoginVO user	
		, @SessionAttribute(name="lec_code", required=false) String lec_code
		, @SessionAttribute(value="authMap", required=false) Map<String, Object> authMap
		, @RequestParam("bo_no") int bo_no
		, Model model
		, SessionStatus sessionStatus
	) {
		// 확인한 bo_no와 지금 들어온 bo_no 비교
		BoardVO board = boardService.selectBoard(bo_no);
		String boSecretAt = board.getBo_secret_at();
		boolean authChk = false;
		String view = null;
		String userSec = user.getUser_section();
		
		if("N".equals(boSecretAt) || "PR".equals(userSec)) {
			authChk = true;
		}else {
			if(authMap != null) {
				int authBoNo = Integer.parseInt(String.valueOf(authMap.get("bo_no")));
				String authId = String.valueOf(authMap.get("user_id"));
				String userId = user.getUser_id();
				
				if("PR".equals(user.getUser_section())) authChk = true;
				if(bo_no == authBoNo && userId.equals(authId)) authChk = true;
			}
		}
		
		if(!authChk) {
			view = "redirect:/lecture/password.do?bo_no=" + bo_no;
		}else {
			model.addAttribute("user_id", user.getUser_id());
			model.addAttribute("board", board);
			view = "lecture/qnaView";
		}
		sessionStatus.setComplete();
		
		model.addAttribute("lec_code", lec_code);
		
		return view;
	}
	
	@RequestMapping("/lecture/qnaInsert.do")
	public String qnaInsertForm(
		@SessionAttribute(name="lec_code", required=false) String lec_code
		, Model model
	) {
		
		return "lecture/qnaForm";
	}
	
	@RequestMapping(value="/lecture/qnaInsert.do", method=RequestMethod.POST)
	public String qnaInsert(
			@AuthenticationPrincipal(expression="realUser") UserLoginVO user
			, @SessionAttribute(name="lec_code", required=false) String lec_code
			, @Validated(GMBoardInsertGroup.class)
			@ModelAttribute("board") BoardVO board
			, BindingResult errors 
			, Model model
		) {
		/** 파라미터 조회  */
		String bo_kind = boardService.selectBoKind("강의문의"); 
		board.setLec_code(lec_code);
		board.setBo_writer(user.getUser_id());
		board.setBo_kind(bo_kind);
		String view = null;
		String message = null;
		
		/** 파라미터 검증 */
		boolean valid = !(errors.hasErrors());
		if(valid) {
			/** 서비스 호출 */
			ServiceResult result = boardService.insertBoard(board);
			
			if(ServiceResult.OK.equals(result)) {
				view = "redirect:/lecture/qna.do";
			}else {
				message = "게시글 등록에 실패하였습니다. 잠시 후 다시 시도해주세요.";
				view = "lecture/qnaForm";
			}
		}else {
			message = "필수항목 누락";
			view = "lecture/qnaForm";			
		}
		
		/** 결과자료 구성 */
		model.addAttribute("message", message);
		model.addAttribute("board", board);
		
		/** 화면설정 후 반환 */ 
		return view;
	}
	
	@RequestMapping("/lecture/qnaUpdate.do")
	public String qnaUpdateForm(
		@RequestParam("bo_no") int bo_no
		, Model model
		) {
		BoardVO board = boardService.selectBoard(bo_no);
		model.addAttribute("board", board);
		
		return "lecture/qnaForm";
	}
	
	@RequestMapping(value="/lecture/qnaUpdate.do", method=RequestMethod.POST)
	public String qnaUpdate(
			@SessionAttribute(name="lec_code", required=false) String lec_code
			, @Validated(GMBoardUpdateGroup.class)
			@ModelAttribute("board") BoardVO board
			, BindingResult errors
			, Model model
			) {
		logger.info("bo_secret_at : {}", board.getBo_secret_at());
		/** 파라미터 조회 */
		String view = null;
		String message = null;
		
		/** 파라미터 검증 */
		boolean valid = !(errors.hasErrors());
		if(valid) {
			/** 서비스 호출 */
			ServiceResult result = boardService.updateBoard(board);
			
			if(ServiceResult.OK.equals(result)) {
				view = "redirect:/lecture/qna.do";
			}else if(ServiceResult.INVALIDPASSWORD.equals(result)){
				message = "비밀번호를 잘못입력했습니다. 다시 입력해주세요.";
				view = "lecture/qnaForm";
			}else {
				message = "게시글 등록에 실패하였습니다. 잠시 후 다시 시도해주세요.";
				view = "lecture/qnaForm";
			}
		}else {
			message = "필수항목 누락";
			view = "lecture/qnaForm";			
		}
		
		/** 결과자료 구성 */
		model.addAttribute("message", message);
		model.addAttribute("board", board);
		
		/** 화면설정 후 반환 */ 
		return view;
	}
	
	@RequestMapping("/lecture/qnaDelete.do")
	public String qnaDelete(
		@Validated(BoardDeleteGroup.class)
		@ModelAttribute("board") BoardVO board
		, BindingResult errors
		, RedirectAttributes session
		) {
		String view = null;
		String message = null;
		boolean valid = !errors.hasErrors();
		
		if(valid) {
			ServiceResult result = boardService.deleteBoard(board);
			
			if(ServiceResult.OK.equals(result)) {
				message = "게시글이 삭제되었습니다.";
				view = "redirect:/lecture/qna.do";
			}else {
				message = "게시글 삭제를 실패하였습니다. 잠시 후 다시 시도해주세요.";
				view = "lecture/qnaView.do";
			}
		}else {
			message = "존재하지 않는 게시글입니다.";
			view = "redirect:/lecture/qna.do";
		}
		session.addFlashAttribute("message", message);
		
		return view;
	}
	
	@RequestMapping("/lecture/qnaAnsUpdate.do")
	public String ansUpdate(
		@AuthenticationPrincipal(expression="realUser") UserLoginVO user
		, @Validated(AnsBoardUpdateGroup.class)
		@ModelAttribute("board") BoardVO board
		, BindingResult errors
		, RedirectAttributes session
		) {
		board.setAns_writer(user.getUser_id());
		String message = null;
		String view = null;
		boolean valid = !errors.hasErrors();
		
		if(valid) {
			ServiceResult result = boardService.qnaBoardAnsUpdate(board);
			
			if(ServiceResult.OK.equals(result)) {
				view = "redirect:/lecture/qna.do";
			}else {
				message = "답변 등록에 실패하였습니다. 잠시 후 다시 시도해주세요.";
//				view = "redirect:/lecture/qna.do";
				view = "redirect:/lecture/qnaView.do?bo_no=" + board.getBo_no();
			}
		}else {
			message = "내용을 입력해주세요.";
			view = "redirect:/lecture/qnaView.do?bo_no=" + board.getBo_no();
//			view = "redirect:/lecture/qna.do";
		}
		session.addFlashAttribute("message", message);
		
		return view;
	}
}
