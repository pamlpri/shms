package kr.ac.shms.lms.staff.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.MediaType;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.ac.shms.common.enumpkg.ServiceResult;
import kr.ac.shms.common.vo.StaffVO;
import kr.ac.shms.lecture.service.LectureProfessorService;
import kr.ac.shms.lms.login.vo.UserLoginVO;
import kr.ac.shms.lms.staff.service.LmsStaffService;
import kr.ac.shms.lms.student.vo.LectureVO;
import kr.ac.shms.lms.student.vo.SugangVO;
import kr.ac.shms.validator.LectureInsertGroup;

/**
 * @author 박초원
 * @since 2021. 6. 8.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                  수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 6. 8.      박초원      	       최초작성
 * 2021. 6. 8.      송수미      	       강의 개설 기능 구현
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Controller
public class LectureOpenController {
	private static final Logger logger = LoggerFactory.getLogger(LectureOpenController.class);
	
	@Inject
	private LmsStaffService lmsStaffService;
	
	@Inject
	private LectureProfessorService lectureProfService;
	
	@RequestMapping("/lms/lectureOpen.do")
	public String lectureList(
		@AuthenticationPrincipal(expression="realUser") UserLoginVO user
		, Model model
	) {
		String user_id = user.getUser_id();
		StaffVO staffVO = lmsStaffService.staff(user_id);
		
		List<LectureVO> lectures = lectureProfService.selectLecListForOpen(user_id);
		
		model.addAttribute("staff", staffVO);
		model.addAttribute("lectures", lectures);
		
		return "lms/lectureOpen";
	}
	
	@RequestMapping(value="/lms/lectureOpen.do", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public SugangVO lectureDetail(
		@RequestParam String lec_code
	) {
		
		SugangVO lectureInfo = lectureProfService.selectLecForOpen(lec_code);
		
		return lectureInfo;
	}
	
	@RequestMapping(value="/lms/lectureOpen.do", method=RequestMethod.POST)
	public String lectureOpen(
		@Validated(LectureInsertGroup.class)
		@ModelAttribute("lecture") SugangVO lectureVO
		, Errors errors
		, @AuthenticationPrincipal(expression="realUser") UserLoginVO user
		, Model model
		, RedirectAttributes session
	){
		
		boolean valid = !errors.hasErrors();
		lectureVO.setBo_writer(user.getUser_id());
		lectureVO.setBiz_type("GG");
		
		lectureList(user, model);
		
		String view = null;
		String message = null;
		double midterm = 0;
		double finals = 0;
		double attend = 0; 
		double task = 0;
		double etc = 0;
		double sum = 0;
		
		if(lectureVO.getMidterm()!=null) midterm = (double)lectureVO.getMidterm() / 100;
		if(lectureVO.getFinals()!=null) finals = (double)lectureVO.getFinals() / 100;
		if(lectureVO.getAttend()!=null) attend = (double)lectureVO.getAttend() / 100;
		if(lectureVO.getTask()!=null) task = (double)lectureVO.getTask() / 100;
		if(lectureVO.getEtc()!=null) etc = (double)lectureVO.getEtc() / 100;
		
		if(valid) {
			sum = midterm + finals + attend + task + etc;
			if(midterm < 0 || finals < 0 || attend < 0 || task < 0 || etc < 0
				|| midterm > 100 || finals > 100 || attend > 100 || task > 100 || etc > 100 ) {
				message = "평가방법에는 0과 100 사이의 수만 입력할  수 있습니다.";
				view = "lms/lectureOpen";
			}else if(sum != 1) {
				message = "평가방법의 총합은 100이어야 합니다.";
				view = "lms/lectureOpen";
			}else if(lectureVO.getAttachList() == null){
				message = "반드시 강의 계획서 파일을 첨부하여야 합니다.";
				view = "lms/lectureOpen";
			}else {
				ServiceResult result = lectureProfService.insertLecture(lectureVO);
				if(ServiceResult.OK.equals(result)) {
					logger.info("성공");
					message = "강의가 개설되었습니다.";
					view = "redirect:/lms/lectureList.do";
					session.addFlashAttribute("message", message);
				}else {
					logger.info("실패");
					message = "강의 개설에 실패하였습니다. 잠시 후 다시 시도해주세요";
					view = "lms/lectureOpen";
				}
			}
		}else {
			message = "필수항목 누락";
			view = "lms/lectureOpen";
		}
		model.addAttribute("lectureVO", lectureVO);
		model.addAttribute("message", message);
		
		return view;
	}
	
}
