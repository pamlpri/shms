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
import org.springframework.web.bind.annotation.SessionAttribute;

import kr.ac.shms.common.enumpkg.ServiceResult;
import kr.ac.shms.common.service.CommonAttachService;
import kr.ac.shms.common.vo.AttachVO;
import kr.ac.shms.lecture.service.LectureService;
import kr.ac.shms.lecture.service.LectureStudentService;
import kr.ac.shms.lecture.vo.ExamVO;
import kr.ac.shms.lecture.vo.QuesVO;
import kr.ac.shms.lecture.vo.TakeExamVO;
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
 * 2021. 6. 16.      송수미      	       학생 시험 목록 조회 기능 구현
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Controller
public class ExamStudentController {
	private static final Logger logger = LoggerFactory.getLogger(ExamStudentController.class);
	
	@Inject
	private LectureStudentService lectureStudentService;
	@Inject
	private LectureService lectureService;
	@Inject
	private CommonAttachService commonAttachService;
	
	@RequestMapping("/lecture/exam.do")
	public String exam(
			@AuthenticationPrincipal(expression="realUser") UserLoginVO user
			, @SessionAttribute(name="lec_code", required=false) String lec_code
			, Model model
		) {
		/** 파라미터 조회 */
		Map<String, String> search = new HashMap<>();
		search.put("lec_code", lec_code);
		search.put("stdnt_no", user.getUser_id());
		
		/** 서비스 호출 */
		List<ExamVO> examList = lectureStudentService.selectExamList(search);
		
		/** 결과 자료 구성 */
		model.addAttribute("examList", examList);
		logger.info("examList : {}" , examList);
		
		/** 화면설정 후 반환 */
		return "lecture/exam";
	}
	
	@RequestMapping("/lecture/examInfo.do")
	public String examInfo(
		@SessionAttribute(name="lec_code", required=false) String lec_code
		, @RequestParam("exam_no") int exam_no
		, Model model
	) {
		ExamVO exam = lectureStudentService.selectExamInfo(exam_no);
		
		model.addAttribute("exam", exam);
		return "lecture/examInfo";
	}
	
	@RequestMapping("/lecture/examForm.do")
	public String examForm(
			@SessionAttribute(name="lec_code", required=false) String lec_code
			, @RequestParam("exam_no") int exam_no
			, Model model
			) {
		
		ExamVO exam = lectureStudentService.selectExamInfo(exam_no);
		List<QuesVO> quesList = lectureStudentService.selectExamQues(exam_no);
		model.addAttribute("quesList", quesList);
		model.addAttribute("exam", exam);
		return "lecture/examForm";
	}
	
	@RequestMapping("/lecture/examViewer.do")
	public String viewer(
		@ModelAttribute("attach") AttachVO attach
		, Model model
		) {
		AttachVO attvo = commonAttachService.download(attach, "viewer");
		model.addAttribute("attvo", attvo);
		return "downloadView";
		
	}
	
	@RequestMapping(value="/lecture/examForm.do", method=RequestMethod.POST)
	public String submitExam(
		@AuthenticationPrincipal(expression="realUser") UserLoginVO user
		, @SessionAttribute(name="lec_code", required=false) String lec_code
		, @ModelAttribute("takeExam") TakeExamVO takeExam
		, Model model
		) {
		/** 파라미터 조회  */
		// 시험 번호, 강의코드, 학번
		// 시험응시 번호, 시험번호, 질문번호, 답변
		takeExam.setLec_code(lec_code);
		takeExam.setStdnt_no(user.getUser_id());
		String view = null;
		String message = null;
		
		/** 서비스 호출 */
		ServiceResult result = lectureStudentService.insertTakeExam(takeExam);
		
		if(ServiceResult.OK.equals(result)) {
			view = "redirect:/lecture/exam.do?exam_no" + takeExam.getExam_no();
		}else {
			message = "서버 오류로 인한 실패. 잠시 후 다시 시도해주세요";
			view = "lecture/examForm.do?exam_no" + takeExam.getExam_no();
		}
		
		/** 결과자료 구성 */
		model.addAttribute("takeExam", takeExam);
		model.addAttribute("message", message);
		
		/** 화면설정 후 반환 */ 
		return view;
	}
}
