package kr.ac.shms.main.commuity.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.ac.shms.main.commuity.service.BoardService;
import kr.ac.shms.main.commuity.vo.BoardVO;

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
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */

@Controller
public class CollegeQnaPassCheckController {
	
	@Inject
	private BoardService boardService;
	
	@Inject
	private PasswordEncoder encoder;
	
	private static final Logger logger = LoggerFactory.getLogger(CollegeQnaPassCheckController.class);
	
	@RequestMapping("/main/community/collegeQnaPass.do")
	public String collegeQnaPassCheckForm(
			@RequestParam("bo_no") int bo_no
			, Model model
			) {
		
		model.addAttribute("bo_no", bo_no);
		return "main/community/collegeQnaPass";
	}
	
	@RequestMapping(value="/main/community/collegeQnaPass.do", method=RequestMethod.POST)
	public String collegeQnaPassCheck(
			@RequestParam("bo_no") int bo_no
			, @RequestParam("writer_name") String writer_name
			, @RequestParam("writer_pass") String writer_pass
			, Model model
			, RedirectAttributes session
			) {
		
		BoardVO board = boardService.selectBoard(bo_no);
		String saved_pass = board.getBo_password();
		String saved_name = board.getBo_writer();
		
		String view = null;
		boolean match = encoder.matches(writer_pass, saved_pass) && (writer_name.equals(saved_name));
		session.addAttribute("bo_no", bo_no);
		
		if(match) {
			view = "redirect:collegeQnaView.do?bo_no" + bo_no;
		}else {
			session.addFlashAttribute("message", "작성자명 또는 비밀번호가 올바르지 않습니다.");
			view = "redirect:collegeQnaPass.do?bo_no" + bo_no; 
		}
		return view;
	}
	
}
