package kr.ac.shms.lecture.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.fasterxml.jackson.databind.ObjectMapper;

import kr.ac.shms.common.enumpkg.MimeType;
import kr.ac.shms.common.enumpkg.ServiceResult;
import kr.ac.shms.lecture.service.LectureProfessorService;
import kr.ac.shms.lecture.service.LectureService;
import kr.ac.shms.lecture.vo.ExamVO;
import kr.ac.shms.lecture.vo.GradeVO;

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
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Controller
@SessionAttributes("lec_code")
public class GradeAdminController {
	private static final Logger logger = LoggerFactory.getLogger(GradeAdminController.class);
	@Inject
	private LectureProfessorService lectureProfessorService;
	
	@RequestMapping("/lecture/gradeAdmin.do")
	public String gradeAdmin(
		@SessionAttribute(name="lec_code", required=false) String lec_code
		, Model model
	) {
		List<GradeVO> gradeList = lectureProfessorService.selectGradeList(lec_code);
		model.addAttribute("gradeList", gradeList);
		return "lecture/gradeAdmin";
	}
	
	@RequestMapping(value="/lecture/pntGrade.do", method=RequestMethod.POST, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    @ResponseBody
	public String exam(
	     @RequestBody GradeVO grade
		,HttpServletResponse resp
		,Model model
	) throws IOException {
		Map<String, Object> resultMap = new HashMap<>();
		ServiceResult result = lectureProfessorService.updateGrade(grade);
		
		switch(result) {
		case PKDUPLICATED:
			resultMap.put("result", ServiceResult.PKDUPLICATED);
			break;
		case OK:
			resultMap.put("result", ServiceResult.OK);
			break;
		case FAIL:
			resultMap.put("result", ServiceResult.FAIL);
			break;
		}
		
		resp.setContentType(MimeType.JSON.getMime());
		try(
			PrintWriter out = resp.getWriter();	
		){
			ObjectMapper mapper = new ObjectMapper();
			mapper.writeValue(out, resultMap);
		}
		
		return null;
	}
	
	@RequestMapping(value="/lecture/gradeUpdate.do", method=RequestMethod.POST)
	public String gradeUpdate(
		@ModelAttribute("grade") GradeVO grade
		, HttpServletResponse resp
		, Model model
	) throws IOException {
		Map<String, Object> resultMap = new HashMap<>();
		ServiceResult result = lectureProfessorService.updateGradeForAjax(grade);
		
		switch(result) {
		case PKDUPLICATED:
			resultMap.put("result", ServiceResult.PKDUPLICATED);
			break;
		case OK:
			resultMap.put("result", ServiceResult.OK);
			break;
		case FAIL:
			resultMap.put("result", ServiceResult.FAIL);
			break;
		}
		
		resp.setContentType(MimeType.JSON.getMime());
		try(
			PrintWriter out = resp.getWriter();	
		){
			ObjectMapper mapper = new ObjectMapper();
			mapper.writeValue(out, resultMap);
		}
		
		return null;
	}
}
