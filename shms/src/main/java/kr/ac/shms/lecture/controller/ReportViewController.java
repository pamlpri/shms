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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import kr.ac.shms.common.service.CommonAttachService;
import kr.ac.shms.common.vo.AttachVO;
import kr.ac.shms.lecture.service.LectureProfessorService;
import kr.ac.shms.lecture.service.LectureService;
import kr.ac.shms.lecture.service.LectureStudentService;
import kr.ac.shms.lecture.vo.SetTaskVO;
import kr.ac.shms.lecture.vo.TaskSubmitVO;
import kr.ac.shms.lms.login.vo.UserLoginVO;

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
 * 2021. 6. 14.      송수미      	       교수 과제 목록 조회 기능 구현
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Controller
@SessionAttributes({"lec_code", "lec_name"})
public class ReportViewController {
	private static final Logger logger = LoggerFactory.getLogger(ReportViewController.class);
	@Inject
	private LectureProfessorService lectureProfessorService;
	@Inject
	private LectureStudentService lectureStudentService;
	@Inject
	private CommonAttachService commonAttachService;
	@Inject
	private LectureService lectureService;
	
	@RequestMapping("/lecture/report.do")
	public String report(
			@SessionAttribute(name="lec_code", required=false) String lec_code
			, Model model
		) {
		
		List<SetTaskVO> setTaskList = lectureProfessorService.selectSetTaskList(lec_code);
		model.addAttribute("setTaskList", setTaskList);
		
		return "lecture/report";
		
	}
	
	@RequestMapping("/lecture/reportList.do")
	public String reportList(
			@SessionAttribute(name="lec_name", required=false) String lec_name
			, @RequestParam("set_task_no") Integer set_task_no
			, Model model
		) {
		/** 파라미터 조회 */
		String lec_code = getLecCode(set_task_no, model);
		Map<String, Object> search = new HashMap<>();
		search.put("set_task_no", set_task_no);
		search.put("lec_code", lec_code);
		
		/** 서비스 호출 */
		SetTaskVO setTask = lectureProfessorService.selectSetTaskInfo(search);
		List<TaskSubmitVO> taskSubmitList = lectureProfessorService.selectTaskSubmitList(search);
		
		/** 자료 구성 */
		model.addAttribute("setTask", setTask);
		model.addAttribute("taskSubmitList", taskSubmitList);
		
		/** 반환 */
		return "lecture/reportList";
	}
	
	public String getLecCode(
		int set_task_no
		, Model model
		) {
		SetTaskVO setTask = lectureService.selectLecCodeForTask(set_task_no);
		String lec_code = setTask.getLec_code();
		String lec_name = setTask.getLec_name();
		
		model.addAttribute("lec_code", lec_code);
		model.addAttribute("lec_name", lec_name);
		return lec_code; 
	}
	
	@RequestMapping("/lecture/reportView.do")
	public String taskView(
			@AuthenticationPrincipal(expression="realUser") UserLoginVO user
			, @SessionAttribute(name="lec_code", required=false) String lec_code
			, @SessionAttribute(name="lec_name", required=false) String lec_name
			, @RequestParam("submit_no") Integer submit_no
			, Model model
		) {
		/** 서비스 호출 */
		TaskSubmitVO taskSubmit = lectureStudentService.selectTaskSubmit(submit_no);
		
		/** 자료 구성 */
		model.addAttribute("taskSubmit", taskSubmit);
		
		/** 반환 */
		return "lecture/taskView";
	}
	
	@RequestMapping(value="/lecture/taskSubmitDownload.do")
	public String downloader(
		@ModelAttribute("attach") AttachVO attach
		, Model model
	) {
		AttachVO attvo = commonAttachService.download(attach, null);
		model.addAttribute("attvo", attvo);		
		return "downloadView";
	}
	
	
}
