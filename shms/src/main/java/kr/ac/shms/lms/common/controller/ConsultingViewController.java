package kr.ac.shms.lms.common.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.MediaType;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ac.shms.common.enumpkg.ServiceResult;
import kr.ac.shms.common.vo.StaffVO;
import kr.ac.shms.lms.common.service.LmsCommonService;
import kr.ac.shms.lms.common.vo.ConsltDiaryVO;
import kr.ac.shms.lms.login.vo.UserLoginVO;
import kr.ac.shms.lms.staff.service.LmsStaffService;
import kr.ac.shms.lms.student.service.StudentService;
import kr.ac.shms.lms.student.vo.ConsultingVO;
import kr.ac.shms.lms.student.vo.StudentVO;

/**
 * @author 박초원
 * @since 2021. 6. 2.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일            수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 6. 2.      박초원      	       최초작성
 * 2021. 6. 3.		최희수		지도교수 상담 구현
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Controller
@RequestMapping("/lms")
public class ConsultingViewController {
	private static final Logger logger = LoggerFactory.getLogger(ConsultingViewController.class);
	@Inject
	private StudentService studentService;
	@Inject
	private LmsCommonService lmsCommonService;
	
	@RequestMapping("/consultingList.do")
	public String consultingList(
		@AuthenticationPrincipal(expression="realUser") UserLoginVO user
		, Model model
	) {
		String userSection = user.getUser_section();
		String user_id = user.getUser_id();
		List<ConsultingVO> consultingList = studentService.consltReqList(user_id);
		model.addAttribute("consultingList", consultingList);
		model.addAttribute("userSection", userSection);
		
		return  "lms/consultingList";
	}
	
	
	@RequestMapping("/consultingView.do")
	public String consultingView(
		@AuthenticationPrincipal(expression="realUser") UserLoginVO user
		, @RequestParam("bo_no") int bo_no
		, Model model
	) {
		String userSection = user.getUser_section();
		ConsultingVO consultingVO = lmsCommonService.consulting(bo_no);
		StudentVO studentVO = studentService.student(consultingVO.getStdnt_no());
		ConsltDiaryVO consltDiaryVO = lmsCommonService.consltDiary(bo_no);
		
		model.addAttribute("student", studentVO);
		model.addAttribute("consulting", consultingVO);
		model.addAttribute("consltDiary", consltDiaryVO);
		model.addAttribute("userSection", userSection);
		
		return  "lms/consultingView";
	}
	
	@RequestMapping(value="/consultingView.do", method=RequestMethod.POST)
	public String consultingViewInsert(
			@ModelAttribute("consltDiary") ConsltDiaryVO consltDiaryVO
			, @RequestParam("isUpdate") String isUpdate
		) {
		ConsultingVO consultingVO = lmsCommonService.consulting(consltDiaryVO.getReq_no());
		consltDiaryVO.setHope_date(consultingVO.getHope_date());
		consltDiaryVO.setHope_time(consultingVO.getHope_time());
		logger.info("consltDiaryVO : {}", consltDiaryVO.getThema());
		ServiceResult result = null;
		if("update".equals(isUpdate)) {
			result = lmsCommonService.consultingDiaryUpdate(consltDiaryVO);
		} else {
			 result = lmsCommonService.consultingDiaryInsert(consltDiaryVO);
		}
		lmsCommonService.consultingCompletion(consltDiaryVO.getReq_no());
		
		String view = null;
		if(ServiceResult.OK.equals(result)) {
			view = "redirect:/lms/consultingView.do?bo_no="+consltDiaryVO.getReq_no();
		}
		return view;
	}
	
	@DeleteMapping(produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ServiceResult delete(
			@RequestParam("req_no") String req_no
		) {
		ServiceResult result = studentService.consultingDelete(req_no);		
		
		return result;
	}
	
	@RequestMapping(value="/consultingSign.do", method=RequestMethod.POST)
	public String consultingSing(
			@ModelAttribute("consultingVO") ConsultingVO consultingVO
			, @RequestParam("update") String update
		) {
		logger.info("consultingVo : {}", consultingVO);
		logger.info("update {}", update);
		ServiceResult result = null;
		if("insert".equals(update)) {
			result = studentService.consultingInsert(consultingVO);
		} else if("update".equals(update)) {
			result = studentService.consultingUpdate(consultingVO);
		}
		String view = null;
		if(ServiceResult.OK.equals(result)) {
			view = "redirect:/lms/consultingList.do";
		}
		return view;
	}
	
}
