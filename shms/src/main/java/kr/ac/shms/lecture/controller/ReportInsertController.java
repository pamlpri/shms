package kr.ac.shms.lecture.controller;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.MediaType;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.fasterxml.jackson.databind.ObjectMapper;

import kr.ac.shms.common.enumpkg.MimeType;
import kr.ac.shms.common.enumpkg.ServiceResult;
import kr.ac.shms.lecture.dao.LectureProfessorDAO;
import kr.ac.shms.lecture.service.LectureProfessorService;
import kr.ac.shms.lecture.vo.SetTaskVO;
import kr.ac.shms.lms.login.vo.UserLoginVO;
import kr.ac.shms.validator.SetTaskInsertGroup;

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
 * 2021. 6. 12.      송수미      	       과제 등록 기능 구현
 * 2021. 6. 26.      박초원				   과제 성적부 반영
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Controller
public class ReportInsertController {
	private static final Logger logger = LoggerFactory.getLogger(ReportInsertController.class);
	@Inject
	private LectureProfessorService lectureProfessorService;
	
	@Inject
	private LectureProfessorDAO lectureProfessorDAO;
	
	@RequestMapping("/lecture/reportInsert.do")
	public String reportForm(
			@SessionAttribute(name="lec_code", required=false) String lec_code
			, @SessionAttribute(name="lec_name", required=false) String lec_name
			, Model model
		) {
		
		return "lecture/reportForm";
		
	}
	
	@RequestMapping(value="/lecture/reportInsert.do", method=RequestMethod.POST)
	public String insertReport(
			@AuthenticationPrincipal(expression="realUser") UserLoginVO user
			, @SessionAttribute(name="lec_code", required=false) String lec_code
			, @SessionAttribute(name="lec_name", required=false) String lec_name
			, @Validated(SetTaskInsertGroup.class)
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
		setTask.setBo_writer(user.getUser_id());
		setTask.setBiz_type("GC");
		
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
				ServiceResult result = lectureProfessorService.insertSetTask(setTask);
				if(ServiceResult.OK.equals(result)) {
					view = "redirect:/lecture/report.do";
				}else {
					setTask.setSubmit_endde(endde);
					message = "과제 등록에 실패하였습니다. 잠시 후 다시 시도해주세요.";
					view = "lecture/reportForm";
				}
			}
		}else {
			setTask.setSubmit_endde(endde);
			message = "필수항목 누락";
			view = "lecture/reportForm";
		}
		
		/** 결과자료 구성 */
		logger.info("message : {}", message);
		model.addAttribute("message", message);
		model.addAttribute("setTask", setTask);
		
		/** 화면설정 후 반환*/
		return view;
	}
	
	@RequestMapping(value="/lecture/reportGrade.do")
	@ResponseBody
	public int reportGrade(
		@SessionAttribute(name="lec_code", required=false) String lec_code
		,Model model
	) {
		logger.info("lec_code {}, {}", lec_code, "확인");
		Map<String, Object> pMap = new HashMap<>();
		pMap.put("p_lec_code", lec_code);
		lectureProfessorDAO.updateReportGrade(pMap);
		Integer updateCount = (Integer) pMap.get("updateCount");
		logger.info("updateCount {}, {}", updateCount, "확인");
		model.addAttribute("updateCount",updateCount);
		
		return updateCount;
	}
}
