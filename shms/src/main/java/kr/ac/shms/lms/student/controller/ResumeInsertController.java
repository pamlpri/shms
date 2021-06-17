package kr.ac.shms.lms.student.controller;

import javax.inject.Inject;
import javax.servlet.annotation.MultipartConfig;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

import kr.ac.shms.common.enumpkg.ServiceResult;
import kr.ac.shms.common.service.CommonAttachService;
import kr.ac.shms.common.service.impl.CommonAttachServiceImpl;
import kr.ac.shms.common.vo.AttachVO;
import kr.ac.shms.common.vo.SubjectVO;
import kr.ac.shms.lms.common.controller.ResumeDetailViewController;
import kr.ac.shms.lms.common.service.LmsCommonService;
import kr.ac.shms.lms.login.vo.UserLoginVO;
import kr.ac.shms.lms.student.service.StudentService;
import kr.ac.shms.lms.student.vo.EditReqVO;
import kr.ac.shms.lms.student.vo.MypageVO;

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
 * 2021. 6. 17.		  최희수	    이력서/자소서 첨삭
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Controller
@RequestMapping("/lms")
public class ResumeInsertController {
	private static final Logger logger = LoggerFactory.getLogger(ResumeInsertController.class);
	@Inject
	private StudentService studentService;
	@Inject
	private CommonAttachServiceImpl commonAttachServiceImpl; 
	@Inject
	private CommonAttachService commonAttachService; 
	
	@RequestMapping("/resumeForm.do")
	public String resumeForm(
		@AuthenticationPrincipal(expression="realUser") UserLoginVO user
		, Model model
		, @RequestParam(value="bo_no", required=false) Integer bo_no
		, @RequestParam(value="state", required=false) String state
	) {
		model.addAttribute("bo_no", bo_no);
		if(bo_no != null) {
			EditReqVO editReq = studentService.selectEditReq(bo_no);
			if(editReq != null) {
				model.addAttribute("editReq", editReq);
			}
		}
		MypageVO myPageVO = studentService.regInfo(user.getUser_id());
		model.addAttribute("mypage", myPageVO);
		model.addAttribute("subject", studentService.subject(myPageVO.getSub_code()));
		return "lms/resumeForm";
	}
	
	@RequestMapping(value="/resumeInsert.do", method=RequestMethod.POST)
	public String insertResume(
		@RequestPart("common_files") MultipartFile common_files
		, @ModelAttribute("editReqVO") EditReqVO editReqVO	
		
	) {
		editReqVO.setBo_writer(editReqVO.getStdnt_no());
		editReqVO.setBiz_type("CS");
		ServiceResult result = studentService.insertEditReq(editReqVO);
		int cnt = commonAttachServiceImpl.processes(editReqVO, "/resume");
		String view = null;
		if(ServiceResult.OK.equals(result) && cnt > 0) {
			view = "redirect:/lms/resume.do";
		}
		return view;
	}
	
	@RequestMapping(value="/resumeUpdate.do", method=RequestMethod.POST)
	public String updateResume(
		@RequestPart("common_files") MultipartFile common_files
		, @ModelAttribute("editReqVO") EditReqVO editReqVO
	) {
		editReqVO.setBo_writer(editReqVO.getStdnt_no());
		editReqVO.setBiz_type("CS");
		ServiceResult result = studentService.updateEditReq(editReqVO);
		String view = null;
		if(ServiceResult.OK.equals(result)) {
			view = "redirect:/lms/resumeForm.do?bo_no=" + editReqVO.getEdit_req_no();
		}
		return view;
	}
	
	@RequestMapping(value="/resumeDelete.do", method=RequestMethod.POST)
	public String deleteResume(
		@ModelAttribute("editReqVO") EditReqVO editReqVO
	) {
		ServiceResult result = studentService.deleteEditReq(editReqVO);
		String view = null;
		if(ServiceResult.OK.equals(result)) {
			view = "redirect:/lms/resume.do";
		}
		return view;
	}
	
	@RequestMapping(value="/resumeDownload.do")
	public String downloader(
		@ModelAttribute("attach") AttachVO attach
		, Model model
	) {
		AttachVO attvo = commonAttachService.download(attach, null);
		model.addAttribute("attvo", attvo);		
		return "downloadView";
	}
	
}
