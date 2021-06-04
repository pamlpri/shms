package kr.ac.shms.lms.common.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.MediaType;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ac.shms.common.vo.StaffVO;
import kr.ac.shms.lms.common.service.LmsCommonService;
import kr.ac.shms.lms.common.vo.UserVO;
import kr.ac.shms.lms.common.vo.WebmailVO;
import kr.ac.shms.lms.login.vo.UserLoginVO;
import kr.ac.shms.lms.staff.service.LmsStaffService;
import kr.ac.shms.lms.student.controller.MypageController;
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
	
	@RequestMapping("/lms/compose.do")
	public String compose(
		@RequestParam("receiver") String receiver
		, @RequestParam("cc_at") String ccReceiver
		, @ModelAttribute("vo") WebmailVO webmailVO
	) {
	logger.info("receiver {}", receiver);
	logger.info("ccReceiver {}", ccReceiver);
	String cc_atType = "N";
	ArrayList<String> receiverList = new ArrayList<>();
	receiverList.add(receiver);
	if(!ccReceiver.isEmpty()) {
		cc_atType = "Y";
		receiverList.add(ccReceiver);
	}
	for(int i=0; i<receiverList.size(); i++) {
		webmailVO.setReceiver(receiverList.get(i));
		if("Y".equals(cc_atType)) {
			if(i == 0) {
				webmailVO.setCc_at("N");
			} else if(i == 1) {
				webmailVO.setCc_at(cc_atType);					
			}
		}
		logger.info("receiverVO {}", webmailVO);
	}
		
		return "";
	}
}
