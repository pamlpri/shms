package kr.ac.shms.lecture.controller;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

import kr.ac.shms.lecture.service.LectureProfessorService;
import kr.ac.shms.lecture.service.LectureService;
import kr.ac.shms.lecture.vo.SetTaskVO;

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
 * 2021. 6. 14.      송수미      	       과제 출제글 수정 기능 구현
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Controller
public class ReportUpdateController {
	private static final Logger logger = LoggerFactory.getLogger(ReportUpdateController.class);
	@Inject
	private LectureProfessorService lectureProfessorService;
	@Inject
	private LectureService lectureService;
	
	@RequestMapping("/lecture/reportUpdate.do")
	public String reportForm(
			@SessionAttribute(name="lec_code", required=false) String lec_code
			, @RequestParam("set_task_no") Integer set_task_no
			, Model model
		) {
		
		SetTaskVO setTask = lectureProfessorService.selectSetTask(set_task_no);
		String endde = setTask.getSubmit_endde();
		
		if(StringUtils.isNotBlank(endde)) {
			String date = endde.substring(0, endde.indexOf(" "));
			String time = endde.substring(endde.indexOf(" ") + 1);
			String setEndde = date + "T" + time;
			setTask.setSubmit_endde(setEndde);
		}
		
		model.addAttribute("setTask", setTask);
		return "lecture/reportForm";
	}
	
	@RequestMapping(value="/lecture/reportUpdate.do", method=RequestMethod.POST)
	public String reportUpdate(
			
		) {
		
		return null;
	}
	
}
