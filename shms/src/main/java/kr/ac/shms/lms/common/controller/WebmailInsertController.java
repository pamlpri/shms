package kr.ac.shms.lms.common.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.MediaType;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ac.shms.common.enumpkg.ServiceResult;
import kr.ac.shms.common.vo.StaffVO;
import kr.ac.shms.lms.common.service.LmsCommonService;
import kr.ac.shms.lms.common.vo.ReceiverVO;
import kr.ac.shms.lms.common.vo.UserVO;
import kr.ac.shms.lms.common.vo.WebmailVO;
import kr.ac.shms.lms.login.vo.UserLoginVO;
import kr.ac.shms.lms.staff.service.LmsStaffService;
import kr.ac.shms.lms.student.service.StudentService;
import kr.ac.shms.lms.student.vo.StudentVO;

/**
 * @author 박초원
 * @since 2021. 6. 2.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일          수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 6. 2.    박초원      	       최초작성
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */

@Controller
public class WebmailInsertController {
	private static final Logger logger = LoggerFactory.getLogger(WebmailInsertController.class);
	
	@Inject
	private StudentService studentService;
	
	@Inject
	private LmsStaffService lmsStaffService;
	
	@Inject
	private	LmsCommonService lmsCommonService; 
	
	@RequestMapping(value="/lms/addressBook.do", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public UserVO addressBook(
		@AuthenticationPrincipal(expression="realUser") UserLoginVO user
		, @RequestParam(value="searchType", required=false) String searchType
		, @RequestParam(value="searchWord", required=false) String searchWord
		, Model model
	) {
		String user_id = user.getUser_id();
		StudentVO studentVO = studentService.student(user_id);
		StaffVO staffVO = lmsStaffService.staff(user_id);
		
		if(staffVO != null && studentVO == null) {
			model.addAttribute("staff", staffVO);
		}else if(staffVO == null && studentVO != null) {
			model.addAttribute("student", studentVO);
		}
		
		UserVO userVO = new UserVO();
		Map<String, Object> searchMap = new HashMap<>();
		searchMap.put("searchType", searchType);
		searchMap.put("searchWord", searchWord);
		userVO.setSearchMap(searchMap);
		
		List<UserVO> userList = (List<UserVO>)lmsCommonService.selectAddressBook(userVO);
		userVO.setUserList(userList);
		
		return userVO;
	}
	
	@RequestMapping("/lms/composeForm.do")
	public String composeForm(
		@AuthenticationPrincipal(expression="realUser") UserLoginVO user
		, Model model
	) {
		String user_id = user.getUser_id();
		StudentVO studentVO = studentService.student(user_id);
		StaffVO staffVO = lmsStaffService.staff(user_id);
		
		if(staffVO != null && studentVO == null) {
			model.addAttribute("staff", staffVO);
		}else if(staffVO == null && studentVO != null) {
			model.addAttribute("student", studentVO);
		}
		
		return  "lms/compose";
	}
	
	@RequestMapping(value="/lms/compose.do", method=RequestMethod.POST)
	public String compose(
		@RequestParam("receiver") String receiver
		, @RequestParam("receiverCC") String receiverCC
		, @ModelAttribute("webmail") WebmailVO webmailVO
		, Model model
	) {
		String[] to = receiver.split(","); 
		String[] cc = receiverCC.split(",");
		logger.info("receiver : {}", receiver);
		logger.info("receivercc : {}", receiverCC);
		logger.info("sender : {}", webmailVO.getSender());
		List<ReceiverVO> receiverList = new ArrayList<>();
		for(int i = 0; i < to.length; i++) {
			ReceiverVO receiverVO = new ReceiverVO();
			receiverVO.setReceiver(to[i].trim());
			receiverVO.setCc_at("N");
			receiverList.add(receiverVO);
			logger.info("receiverList : {}", receiverList.toString());
		}
		
		for(int i = 0; i < cc.length; i++) {
			ReceiverVO receiverVO = new ReceiverVO();
			receiverVO.setReceiver(cc[i].trim());
			logger.info("cc : {}", cc[i].trim());
			receiverVO.setCc_at("Y");
			receiverList.add(receiverVO);
			logger.info("receiverList : {}", receiverList.toString());
		}
		 
		if(receiverList != null && receiverList.size() >0 ) {
			webmailVO.setReceiverList(receiverList);
		}
		
		String view = null;
		String message = null;
		ServiceResult result = lmsCommonService.insertWebmail(webmailVO);
		if(ServiceResult.OK.equals(result)) {
			view = "lms/send";
		}else {
			message = "서버 오류입니다.";
			view = "lms/compose";
		}
		
		model.addAttribute("message", message);
			
		return view;
	}
}
