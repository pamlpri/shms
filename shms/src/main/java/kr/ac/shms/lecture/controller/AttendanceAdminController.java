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
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.fasterxml.jackson.databind.ObjectMapper;

import kr.ac.shms.common.enumpkg.MimeType;
import kr.ac.shms.common.enumpkg.ServiceResult;
import kr.ac.shms.lecture.service.LectureProfessorService;
import kr.ac.shms.lecture.service.LectureStudentService;
import kr.ac.shms.lms.student.vo.AttendVO;

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
 * 2021. 6. 21.      박초원				 교수 학생 출석수정
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Controller
public class AttendanceAdminController {
	private static final Logger logger = LoggerFactory.getLogger(AttendanceAdminController.class);
	@Inject
	private LectureProfessorService lectureProfessorService;

	@RequestMapping("/lecture/attendanceAdmin.do")
	public String attendanceAdmin(
			@SessionAttribute(name="lec_code", required=false) String lec_code
			, Model model
		) {
		List<AttendVO> attendList = lectureProfessorService.selectAttendStudentList(lec_code);
		model.addAttribute("attendList", attendList);
		return "lecture/attendanceAdmin";
	}
	
	@RequestMapping(value="/lecture/attendanceUpdate.do", method=RequestMethod.POST)
	public String attendanceUpdate(
		@ModelAttribute("attned") AttendVO attend
		, HttpServletResponse resp
		, Model model
	) throws IOException {
		Map<String, Object> resultMap = new HashMap<>();
		ServiceResult result = lectureProfessorService.updateStudentAttend(attend);
		
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
