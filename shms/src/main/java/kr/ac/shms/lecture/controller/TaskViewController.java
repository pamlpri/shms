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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.ac.shms.common.enumpkg.ServiceResult;
import kr.ac.shms.lecture.service.LectureProfessorService;
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
 * 2021. 6. 14.      송수미      	       학생 과제 조회 기능 구현
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Controller
public class TaskViewController {
	private static final Logger logger = LoggerFactory.getLogger(TaskViewController.class);
	
	@Inject
	private LectureStudentService lectureStudentService;
	@Inject
	private LectureProfessorService lectureProfessorService;
	
	@RequestMapping("/lecture/task.do")
	public String taskList(
			@AuthenticationPrincipal(expression="realUser") UserLoginVO user
			, @SessionAttribute(name="lec_code", required=false) String lec_code
			, @SessionAttribute(name="lec_name", required=false) String lec_name
			, Model model
		) {
		
		/** 파라미터 조회 */
		Map<String, String> search = new HashMap<>();
		search.put("lec_code", lec_code);
		search.put("stdnt_no", user.getUser_id());
		
		/** 서비스 호출 */
		List<SetTaskVO> taskList = lectureStudentService.selectTaskList(search);
		
		/** 반환 */
		model.addAttribute("taskList", taskList);
		
		return "lecture/task";
	}
	
	@RequestMapping(value="/lecture/taskScore.do", method=RequestMethod.POST)
	public String taskScore(
		@ModelAttribute("taskSubmit") TaskSubmitVO taskSubmit
		, RedirectAttributes session
		) {
		/** 파라미터 조회  */ 
		int taskAllot = taskSubmit.getTask_allot();
		int taskScore = taskSubmit.getTask_score();
		int setTaskNo = taskSubmit.getSet_task_no();
		String view = null;
		String message = null;
		
		/** 파라미터 검증 */
		if(taskAllot < taskScore) {
			message = "점수는 0점 이상 과제 등록시 설정한 최대 점수(" + taskAllot + ") 이하로 입력해주세요.";
		}else {
			/** 서비스 호출 */
			ServiceResult result = lectureProfessorService.updateTaskScore(taskSubmit);
			if(ServiceResult.OK.equals(result)) {
				view = "redirect:/lecture/reportList.do?set_task_no=" + setTaskNo;
			}else {
				message = "성적 등록에 실패하였습니다. 잠시 후 다시 시도해주세요";
				view = "redirect:/lecture/reportView.do?submit_no=" + taskSubmit.getSubmit_no();
			}
		}
		
		/** 결과자료 구성 */
		session.addFlashAttribute("message", message);
		
		/** 화면설정 후 반환 */ 
		return view;
	}
	@RequestMapping(value="/lecture/taskScore.do", method=RequestMethod.POST, produces="text/plain;charset=utf8") 
	@ResponseBody
	public String taskScoreForAjax(
		@RequestParam("taskAllot") int taskAllot
		, @RequestParam("setTaskNo") int setTaskNo
		, @RequestParam("submitNo") int submitNo
		, @RequestParam("score") int taskScore
		) {
		/** 파라미터 조회 */
		String message = null;
		TaskSubmitVO taskSubmit = new TaskSubmitVO();
		taskSubmit.setTask_allot(taskAllot);
		taskSubmit.setSet_task_no(setTaskNo);
		taskSubmit.setSubmit_no(submitNo);
		taskSubmit.setTask_score(taskScore);
		
		/** 파라미터 검증 */
		if(taskAllot < taskScore) {
			message= "점수는 0점 이상 과제 등록시 설정한 최대 점수(" + taskAllot + ") 이하로 입력해주세요.";
		}else {
			/** 서비스 호출 */
			ServiceResult result = lectureProfessorService.updateTaskScore(taskSubmit);
			if(ServiceResult.OK.equals(result)) {
				message = "수정이 완료되었습니다.";
			}else {
				message = "성적 등록에 실패하였습니다. 잠시 후 다시 시도해주세요";
			}
		}
		
		return message;
	}
}
