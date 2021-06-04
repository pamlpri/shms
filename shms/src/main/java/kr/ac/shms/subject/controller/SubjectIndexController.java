package kr.ac.shms.subject.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.ac.shms.common.service.BoardService;
import kr.ac.shms.common.vo.BoardVO;
import kr.ac.shms.common.vo.StaffVO;
import kr.ac.shms.subject.service.SubjectService;
import kr.ac.shms.subject.vo.SubjectVO;

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
 * 2021. 5. 27.      송수미      	       학과 메인페이지 기능 구현
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */

@Controller
@SessionAttributes("sub_code")
public class SubjectIndexController {
	
	@Inject
	private BoardService boardService;
	
	@Inject
	private SubjectService subjectService;
	
	@RequestMapping("/subject/main.do")
	public String index(
			@RequestParam("sub") String sub  
			, @SessionAttribute(name="sub_code", required=false) String sub_code
			, Model model 
			) {
//		session에 학과코드 넣어서 갖고 다니기
		Map<String, String> search = new HashMap<>();
		search.put("bo_name", "학과공지");
		search.put("sub_code", sub);
		List<BoardVO> hgList = boardService.selectForMain(search);
		search.put("bo_name", "학과문의");
		List<BoardVO> hmList = boardService.selectForMain(search);
		
		SubjectVO subject = subjectService.selectSub(sub);
		
		List<StaffVO> profList = subjectService.selectProf(sub);
		
		model.addAttribute("hgList", hgList);
		model.addAttribute("hmList", hmList);
		model.addAttribute("subject", subject);
		model.addAttribute("profList", profList);
		
		model.addAttribute("sub_code", sub);
		
		return "subject/main";
	}
}
