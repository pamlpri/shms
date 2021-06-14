package kr.ac.shms.lecture.controller;

import javax.inject.Inject;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
			@SessionAttribute(name="lec_code", required=false) String lec_code
			, @Validated
			@ModelAttribute("setTask") SetTaskVO setTask
			, Errors errors
			, Model model
		) {
		
		/** 파라미터 조회 */
		setTask.setLec_code(lec_code);
		String endde = setTask.getSubmit_endde();
		if(StringUtils.isNotBlank(endde)) {
			String date = endde.substring(0, endde.indexOf("T"));
			String time = endde.substring(endde.indexOf("T") + 1);
			String setEndde = date + " " + time;
			setTask.setSubmit_endde(setEndde);
		}
		
		/** 파라미터 검증 */
		boolean valid = !(errors.hasErrors());
		String message = null;
		String view = null;
		
		if(valid) {
			if(setTask.getTask_allot() < 0 || setTask.getTask_allot() > 100) {
				setTask.setSubmit_endde(endde);
				message = "배점은 0 ~ 100점 사이로 입력해주세요.";
				view = "lecture/reportForm";
			}else {
				/** 서비스 호출 */
				ServiceResult result = lectureProfessorService.updateSetTask(setTask);
				if(ServiceResult.OK.equals(result)) {
					view = "redirect:/lecture/reportList.do?set_task_no=" + setTask.getSet_task_no();
				}else if(ServiceResult.NOTEXIST.equals(result)){
					setTask.setSubmit_endde(endde);
					message = "해당 과제가 존재하지 않습니다.";
					view = "lecture/reportForm";
				}else {
					setTask.setSubmit_endde(endde);
					message = "과제 등록에 실패하였습니다. 잠시 후 다시 시도해주세요.";
					view = "lecture/reportForm";
				}
			}
		}
		
		/** 결과자료 구성 */
		logger.info("message : {}", message);
		model.addAttribute("message", message);
		model.addAttribute("setTask", setTask);
		
		/** 화면 설정 후 반환*/
		return view;
	}
	
}
