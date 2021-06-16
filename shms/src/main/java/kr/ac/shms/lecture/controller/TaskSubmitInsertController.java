package kr.ac.shms.lecture.controller;

import java.util.HashMap;
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

import kr.ac.shms.common.enumpkg.ServiceResult;
import kr.ac.shms.common.vo.AttachVO;
import kr.ac.shms.lecture.service.LectureService;
import kr.ac.shms.lecture.service.LectureStudentService;
import kr.ac.shms.lecture.vo.SetTaskVO;
import kr.ac.shms.lecture.vo.TaskSubmitVO;
import kr.ac.shms.lms.common.vo.UserVO;
import kr.ac.shms.lms.login.vo.UserLoginVO;
import kr.ac.shms.validator.SetTaskInsertGroup;
import kr.ac.shms.validator.TaskInsertGroup;

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
 * 2021. 6. 15.      송수미      	       학생 과제 상세 조회, 등록 기능 구현
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Controller
public class TaskSubmitInsertController {
	private static final Logger logger = LoggerFactory.getLogger(TaskSubmitInsertController.class);
	
	@Inject
	private LectureStudentService lectureStudentService;
	@Inject
	private LectureService lectureService;
	
	@RequestMapping("/lecture/taskInsert.do")
	public String taskForm(
			@AuthenticationPrincipal(expression="realUser") UserLoginVO user
			, @SessionAttribute(name="lec_code", required=false) String lec_code
			, @SessionAttribute(name="lec_name", required=false) String lec_name
			, @RequestParam("set_task_no") int set_task_no
			, Model model
		) {
		/** 검색 조건 */
		Map<String, Object> search = new HashMap<>();
		search.put("set_task_no", set_task_no);
		search.put("stdnt_no", user.getUser_id());
		
		/** 서비스 호출 */
		SetTaskVO setTask = lectureStudentService.selectSetTask(search);
		
		/** 반환 */
		model.addAttribute("setTask", setTask);
		
		return "lecture/taskForm";
	}
	
	@RequestMapping(value="/lecture/setTaskDownload.do")
	public String downloader(
		@ModelAttribute("attach") AttachVO attach
		, Model model
	) {
		AttachVO attvo = lectureStudentService.download(attach);
		model.addAttribute("attvo", attvo);		
		return "downloadView";
	}
	
	@RequestMapping(value="lecture/taskInsert.do", method=RequestMethod.POST)
	public String insertTask(
		@AuthenticationPrincipal(expression="realUser") UserLoginVO user
		, @SessionAttribute(name="lec_code", required=false) String lec_code
		, @SessionAttribute(name="lec_name", required=false) String lec_name
		, @RequestParam("set_task_no") int set_task_no
		, @Validated(TaskInsertGroup.class)
		@ModelAttribute("taskSubmit") TaskSubmitVO taskSubmit
		, Errors errors 
		, Model model
		) {
		
		/** 파라미터 조회 */
		taskSubmit.setWriter(user.getUser_id());
		taskSubmit.setLec_code(lec_code);
		
		/** 검색 조건 */
		Map<String, Object> search = new HashMap<>();
		search.put("set_task_no", set_task_no);
		search.put("stdnt_no", user.getUser_id());
		
		/** 반환 */
		boolean valid = !(errors.hasErrors()); 
		String message = null;
		String view = null;
		
		if(valid) {
			/** 서비스 호출 */
			ServiceResult result = lectureStudentService.insertTask(taskSubmit);
			if(ServiceResult.OK.equals(result)) {
				view = "redirect:/lecture/task.do";
			}else {
				message = "과제 등록에 실패하였습니다. 잠시 후 다시 시도해주세요.";
				view = "lecture/taskForm";
			}
		}else {
			message = "필수항목 누락";
			view = "lecture/taskForm";
		}
		
		/** 결과자료 구성 */
		SetTaskVO setTask = lectureStudentService.selectSetTask(search);
		model.addAttribute("setTask", setTask);
		model.addAttribute("message", message);
		model.addAttribute("taskSubmit", taskSubmit);
		
		return view;
	}
}
