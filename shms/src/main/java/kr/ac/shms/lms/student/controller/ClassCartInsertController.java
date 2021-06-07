package kr.ac.shms.lms.student.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.fasterxml.jackson.databind.ObjectMapper;

import kr.ac.shms.common.enumpkg.MimeType;
import kr.ac.shms.common.enumpkg.ServiceResult;
import kr.ac.shms.lms.login.vo.UserLoginVO;
import kr.ac.shms.lms.student.service.StudentService;
import kr.ac.shms.lms.student.vo.SugangVO;

/**
 * @author 박초원
 * @since 2021. 6. 7.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                  수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 6. 7.      박초원      	       최초작성
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Controller
public class ClassCartInsertController {
	private static final Logger logger = LoggerFactory.getLogger(ClassCartInsertController.class);
	
	@Inject
	private StudentService studentService;
	
	@RequestMapping(value="/lms/classCartInsert.do", method=RequestMethod.POST)
	public SugangVO classCartInsert(
		@AuthenticationPrincipal(expression="realUser") UserLoginVO user
		,@ModelAttribute("sugang") SugangVO sugangVO
		,HttpServletResponse resp
		, Model model
	) throws IOException {
		Map<String, Object> resultMap = new HashMap<>();
		if(ServiceResult.FAIL.equals(studentService.insertCart(sugangVO))) {
			resultMap.put("result", ServiceResult.FAIL);
		}else {
			resultMap.put("result", ServiceResult.OK);
		}
		
		resp.setContentType(MimeType.JSON.getMime());
		try(
			PrintWriter out = resp.getWriter();	
		){
			ObjectMapper mapper = new ObjectMapper();
			mapper.writeValue(out, resultMap);
		}
		
		SugangVO sugang = studentService.selectSugangInfo(sugangVO.getLec_code());
		
		return sugang;
	}
}
