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
import org.springframework.web.bind.annotation.SessionAttributes;

import kr.ac.shms.common.enumpkg.ServiceResult;
import kr.ac.shms.lecture.service.LectureService;
import kr.ac.shms.lecture.service.LectureStudentService;
import kr.ac.shms.lecture.vo.SetTaskVO;
import kr.ac.shms.lecture.vo.TaskSubmitVO;
import kr.ac.shms.lms.login.vo.UserLoginVO;
import kr.ac.shms.validator.TaskUpdateGroup;

/**
 * @author 송수미
 * @since 2021. 6. 15.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                  수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 6. 15.      송수미      	  최초작성
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Controller
@SessionAttributes({"lec_code", "lec_name"})
public class TaskSubmitUpdateController {
	private static final Logger logger = LoggerFactory.getLogger(TaskSubmitInsertController.class);
	
	@Inject
	private LectureStudentService lectureStudentService;
	@Inject
	private LectureService lectureService;
	
	@RequestMapping("/lecture/taskUpdate.do")
	public String taskForm(
			@AuthenticationPrincipal(expression="realUser") UserLoginVO user
			, @SessionAttribute(name="lec_code", required=false) String lec_code
			, @SessionAttribute(name="lec_name", required=false) String lec_name
			, @RequestParam("set_task_no") int set_task_no
			, @RequestParam("submit_no") int submit_no
			, Model model
		) {
		/** 검색 조건 */
		Map<String, Object> search = new HashMap<>();
		search.put("set_task_no", set_task_no);
		search.put("stdnt_no", user.getUser_id());
		getLecCode(set_task_no, model);
		
		/** 서비스 호출 */
		SetTaskVO setTask = lectureStudentService.selectSetTask(search);
		TaskSubmitVO taskSubmit = lectureStudentService.selectTaskSubmit(submit_no);
		
		/** 반환 */
		model.addAttribute("setTask", setTask);
		model.addAttribute("taskSubmit", taskSubmit);
		
		return "lecture/taskForm";
	}
	
	@RequestMapping(value="lecture/taskUpdate.do", method=RequestMethod.POST)
	public String insertTask(
		@AuthenticationPrincipal(expression="realUser") UserLoginVO user
		, @SessionAttribute(name="lec_code", required=false) String lec_code
		, @RequestParam("set_task_no") int set_task_no
		, @Validated(TaskUpdateGroup.class)
		@ModelAttribute("taskSubmit") TaskSubmitVO taskSubmit
		, Errors errors 
		, Model model
		) {
		
		/** 파라미터 조회 */
		taskSubmit.setWriter(user.getUser_id());
		taskSubmit.setLec_code(lec_code);
		taskSubmit.setBo_writer(user.getUser_id());
		taskSubmit.setBiz_type("GJ");
		
		/** 검색 조건 */
		Map<String, Object> search = new HashMap<>();
		search.put("set_task_no", set_task_no);
		search.put("stdnt_no", user.getUser_id());
		getLecCode(set_task_no, model);
		
		/** 반환 */
		boolean valid = !(errors.hasErrors()); 
		String message = null;
		String view = null;
		
		if(valid) {
			/** 서비스 호출 */
			ServiceResult result = lectureStudentService.updateTask(taskSubmit);
			if(ServiceResult.OK.equals(result)) {
				view = "redirect:/lecture/task.do";
			}else {
				message = "과제 수정에 실패하였습니다. 잠시 후 다시 시도해주세요.";
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
}
