package kr.ac.shms.common.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.ac.shms.common.service.BoardService;
import kr.ac.shms.common.vo.BoardVO;

/**
 * @author 박초원
 * @since 2021. 5. 20.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                       수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 5. 20.      박초원      	 최초작성
 * 2021. 5. 22.      박초원		리다이렉트 수정
 * 2021. 5. 25       송수미            게시판 조회 구현
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */

@Controller
public class IndexController {
	
	private static final Logger logger = LoggerFactory.getLogger(IndexController.class);
	
	@Inject
	private BoardService boardService;
	
	
	@RequestMapping({"/", "/index.do"})
	public String index(
			HttpServletRequest request
			, HttpServletResponse response
			, Model model ) throws IOException {
		Map<String, String> search = new HashMap<>();
		search.put("bo_name", "학사공지");
		List<BoardVO> dgList = boardService.selectForMain(search);
		search.put("bo_name", "장학공지");
		List<BoardVO> jgList = boardService.selectForMain(search);
		
		model.addAttribute("jgList", jgList);
		model.addAttribute("dgList", dgList);
		
		if(!request.isSecure()) {
			response.sendRedirect("https://localhost/shms");
			return null;
		}else {			
			return "index";
		}		
	}
}
