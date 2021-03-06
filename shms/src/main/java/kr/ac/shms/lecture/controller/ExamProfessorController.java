package kr.ac.shms.lecture.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.MediaType;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
import kr.ac.shms.common.service.CommonAttachService;
import kr.ac.shms.common.vo.AttachVO;
import kr.ac.shms.lecture.service.LectureProfessorService;
import kr.ac.shms.lecture.vo.ExamVO;
import kr.ac.shms.lecture.vo.QuesVO;
import kr.ac.shms.lms.login.vo.UserLoginVO;
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
 * 2021. 6. 16.      박초원			 교수 시험,문제 조회
 * 2021. 06. 17. 	  박초원			 교수 시험,문제 수정
 * 2021. 6. 22. 	  박초원			 서술형, 단답형 채점, 성적 수정
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Controller
public class ExamProfessorController {
	private static final Logger logger = LoggerFactory.getLogger(ExamProfessorController.class);
	@Inject
	private LectureProfessorService lectureProfessorService;
	
	@Inject
	private CommonAttachService commonAttachService; 
	
	@RequestMapping("/lecture/examAdminForm.do")
	public String examAdminForm(
		@SessionAttribute(name="lec_code", required=false) String lec_code
		, Model model
	) {
		return "lecture/examAdminForm";	
	}
	
	@RequestMapping("/lecture/examInsert.do")
	public String examInsert(
		@SessionAttribute(name="lec_code", required=false) String lec_code
		,@AuthenticationPrincipal(expression="realUser") UserLoginVO user
		, @ModelAttribute("exam") ExamVO exam
		, Model model
	) {
		logger.info("exam {}", exam);
		
	   String exam_begin_dt = exam.getExam_begin_dt();
       if(StringUtils.isNotBlank(exam_begin_dt)) 	{
          String date = exam_begin_dt.substring(0, exam_begin_dt.indexOf("T"));
          String time = exam_begin_dt.substring(exam_begin_dt.indexOf("T") + 1);
          String set_exam_begin_dt = date + " " + time;
          exam.setExam_begin_dt(set_exam_begin_dt);
       }
       
       String exam_end_dt = exam.getExam_end_dt();
       if(StringUtils.isNotBlank(exam_end_dt)) 	{
          String date = exam_end_dt.substring(0, exam_end_dt.indexOf("T"));
          String time = exam_end_dt.substring(exam_end_dt.indexOf("T") + 1);
          String set_exam_end_dt = date + " " + time;
          exam.setExam_end_dt(set_exam_end_dt);
       }
		
		exam.setLec_code(lec_code);
		exam.setBiz_type("SH");
		exam.setBo_writer(user.getUser_id());
		
		String view = null;
		String message = null;
		ServiceResult result = lectureProfessorService.insertExam(exam);
		if(ServiceResult.OK.equals(result)) {
			view = "redirect:/lecture/examAdmin.do";
		}else {
			message = "서버 오류입니다.";
			view = "lecture/examAdminForm";
		}
		
		model.addAttribute("message",message);
		model.addAttribute("exam", exam);
		return view;	
	}
	
	@RequestMapping("/lecture/examAdmin.do")
	public String examAdmin(
		@SessionAttribute(name="lec_code", required=false) String lec_code
		, Model model
	) {
		List<ExamVO> examList = lectureProfessorService.selectExamList(lec_code);
		model.addAttribute("examList", examList);
		return "lecture/examAdmin";
	}
	
	@RequestMapping("/lecture/examAdminList.do")
	public String examAdminList(
		@SessionAttribute(name="lec_code", required=false) String lec_code
		,@RequestParam("what") int exam_no
		, Model model
	) {
		ExamVO examVO = new ExamVO();
		examVO.setLec_code(lec_code);
		examVO.setExam_no(exam_no);
		
		ExamVO exam = lectureProfessorService.selectExamDetail(examVO);
		List<ExamVO> studentList = lectureProfessorService.selectExamStudentList(examVO);
		model.addAttribute("exam", exam);
		model.addAttribute("studentList", studentList);
		return "lecture/examAdminList";
	}
	
	@RequestMapping("/lecture/examUpdate.do")
	public String examUpdateForm(
		@AuthenticationPrincipal(expression="realUser") UserLoginVO user
		,@SessionAttribute(name="lec_code", required=false) String lec_code
		,@RequestParam("what") int exam_no
		, Model model
	) {
		ExamVO examVO = new ExamVO();
		examVO.setLec_code(lec_code);
		examVO.setExam_no(exam_no);
		
		ExamVO exam = lectureProfessorService.selectExamDetail(examVO);
		
		String exam_begin_dt = exam.getExam_begin_dt();
        if(StringUtils.isNotBlank(exam_begin_dt)) {
        	String date = exam_begin_dt.substring(0, exam_begin_dt.indexOf(" "));
        	String time = exam_begin_dt.substring(exam_begin_dt.indexOf(" ") + 1);
        	String set_exam_begin_dt = date + "T" + time;
        	exam.setExam_begin_dt(set_exam_begin_dt);
        }
        
        String exam_end_dt = exam.getExam_end_dt();
        if(StringUtils.isNotBlank(exam_begin_dt)) {
        	String date = exam_end_dt.substring(0, exam_end_dt.indexOf(" "));
        	String time = exam_end_dt.substring(exam_end_dt.indexOf(" ") + 1);
        	String set_exam_end_dt = date + "T" + time;
        	exam.setExam_end_dt(set_exam_end_dt);
        }
        
        List<QuesVO> quesList = lectureProfessorService.selectQuesList(exam_no);
        exam.setQuesList(quesList);
        model.addAttribute("exam", exam);
        model.addAttribute("update", "update");
		return "lecture/examAdminForm";
	}
	
	@RequestMapping(value="/lecture/examUpdate.do", method=RequestMethod.POST)
	public String examUpdate(
		@AuthenticationPrincipal(expression="realUser") UserLoginVO user
		,@SessionAttribute(name="lec_code", required=false) String lec_code
		,@ModelAttribute("exam") ExamVO exam
		, Model model
	) {
		logger.info("exam {}", exam);
		
	   String exam_begin_dt = exam.getExam_begin_dt();
       if(StringUtils.isNotBlank(exam_begin_dt)) 	{
          String date = exam_begin_dt.substring(0, exam_begin_dt.indexOf("T"));
          String time = exam_begin_dt.substring(exam_begin_dt.indexOf("T") + 1);
          String set_exam_begin_dt = date + " " + time;
          if(set_exam_begin_dt.length() > 16) {
        	  set_exam_begin_dt = set_exam_begin_dt.substring(0, 16);
           }

          exam.setExam_begin_dt(set_exam_begin_dt);
       }
       
       String exam_end_dt = exam.getExam_end_dt();
       if(StringUtils.isNotBlank(exam_end_dt)) 	{
          String date = exam_end_dt.substring(0, exam_end_dt.indexOf("T"));
          String time = exam_end_dt.substring(exam_end_dt.indexOf("T") + 1);
          String set_exam_end_dt = date + " " + time;
          if(set_exam_end_dt.length() > 16) {
        	  set_exam_end_dt = set_exam_end_dt.substring(0, 16);
           }
          exam.setExam_end_dt(set_exam_end_dt);
       }
		
		exam.setLec_code(lec_code);
		exam.setBiz_type("SH");
		exam.setBo_writer(user.getUser_id());
		
		String view = null;
		String message = null;
		ServiceResult result = lectureProfessorService.updateExam(exam);
		if(ServiceResult.OK.equals(result)) {
			view = "redirect:/lecture/examAdmin.do";
		}else {
			message = "서버 오류입니다.";
			view = "lecture/examAdminForm";
		}
		
		model.addAttribute("exam",exam);
		model.addAttribute("message",message);
		return view;
	}
			
			
	@RequestMapping(value="/lecture/examDownload.do")
	public String examDownload(
		@ModelAttribute("attach") AttachVO attach
		, Model model
	) {
		AttachVO attvo = commonAttachService.download(attach, null);
		model.addAttribute("attvo", attvo);
		return "downloadView";
	}
	
	@RequestMapping("/lecture/examOMR.do")
	public String examOMR(
			@SessionAttribute(name="lec_code", required=false) String lec_code
			,@RequestParam("exam_no") int exam_no
			,@RequestParam("stdnt_no") String stdnt_no
			, Model model
		) {
		ExamVO exam = new ExamVO();
		exam.setLec_code(lec_code);
		exam.setExam_no(exam_no);
		exam.setStdnt_no(stdnt_no);
		List<QuesVO> quesList = lectureProfessorService.selectStudentOMR(exam);
		model.addAttribute("quesList", quesList);
		return "lecture/examOMR";
	}
	
	@RequestMapping("/lecture/examGradeUpdate.do")
	public String examGradeUpdate(
		@ModelAttribute("exam") ExamVO exam
		,Model model
	) {
		String view = null;
		String message = null;
		
		ServiceResult result = lectureProfessorService.updateExamGrade(exam);
		if(ServiceResult.OK.equals(result)) {
			view = "redirect:/lecture/examAdminList.do?what=" + exam.getExam_no();
		}else {
			message = "서버 오류입니다.";
			view = "lecture/examOMR.do?exam_no=" + exam.getExam_no() +"&stdnt_no=" + exam.getStdnt_no();
		}
		
		model.addAttribute("message", message);
		return view;
	}
	
	@RequestMapping(value="/lecture/examResScore.do", method=RequestMethod.POST)
	public String examResScore(
		@ModelAttribute("exam") ExamVO exam
		, HttpServletResponse resp
		, Model model
	) throws IOException {
		Map<String, Object> resultMap = new HashMap<>();
		ServiceResult result = lectureProfessorService.updateAjaxResScore(exam);
		
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
	
	@RequestMapping(value="/lecture/examGrade.do", method=RequestMethod.POST, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    @ResponseBody
	public String exam(
	     @RequestBody ExamVO exam
		,HttpServletResponse resp
		,Model model
	) throws IOException {
		Map<String, Object> resultMap = new HashMap<>();
		ServiceResult result = lectureProfessorService.insertExamGrade(exam);
		
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
