package kr.ac.shms.lms.common.controller;

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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ac.shms.common.vo.StaffVO;
import kr.ac.shms.lms.common.service.LmsCommonService;
import kr.ac.shms.lms.common.vo.PagingVO;
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
 * 수정일                  수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 6. 2.      박초원      	       최초작성
 * 2021. 6. 2.      송수미      	       받은,보낸 메일 리스트 조회
 * 2021. 6. 3.      송수미      	       받은,보낸 메일 리스트 조회
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Controller
public class WebmailViewController {
	private static final Logger logger = LoggerFactory.getLogger(WebmailViewController.class);
	@Inject
	private StudentService studentService;
	
	@Inject
	private LmsStaffService lmsStaffService;
	
	@Inject
	private LmsCommonService lmsCommonService;
	
	public PagingVO<WebmailVO> settingList(
			int currentPage
			, String user_id
			, String selectMenu
			, String searchWord
			) {
		
		PagingVO<WebmailVO> pagingVO = new PagingVO<>(5, 5);
		pagingVO.setCurrentPage(currentPage);
		
		Map<String, Object> searchMap = new HashMap<>();
		searchMap.put("user_id", user_id);
		searchMap.put("selectMenu", selectMenu);
		searchMap.put("searchWord", searchWord);
		pagingVO.setSearchMap(searchMap);
		
		int totalRecord = lmsCommonService.selectWebmailtotalCnt(pagingVO);
		pagingVO.setTotalRecord(totalRecord);
		
		List<WebmailVO> webmailList = lmsCommonService.selectWebmailList(pagingVO);
		pagingVO.setDataList(webmailList);
		
		return pagingVO;
	}
	
	@RequestMapping("/lms/inbox.do")
	public String inboxList(
		@AuthenticationPrincipal(expression="realUser") UserLoginVO user
		, @RequestParam(value="page", required=false, defaultValue="1") int currentPage
		, @RequestParam(value="searchWord", required=false) String searchWord
		, HttpSession session
		, Model model
	) {
		String user_id = user.getUser_id();
		StudentVO studentVO = studentService.student(user_id);
		StaffVO staffVO = lmsStaffService.staff(user_id);
		
		if(staffVO != null && studentVO == null) {
			session.setAttribute("userName", staffVO.getName());
			model.addAttribute("staff", staffVO);
		}else if(staffVO == null && studentVO != null) {
			session.setAttribute("userName", studentVO.getName());
			model.addAttribute("student", studentVO);
		}
		
		PagingVO<WebmailVO> pagingVO = settingList(currentPage, user_id, "inbox", searchWord);
		
		model.addAttribute("pagingVO", pagingVO);
				
		return  "lms/inbox";
	}
	
	@RequestMapping(value="/lms/inbox.do", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public PagingVO<WebmailVO> inboxListForAjax(
			@AuthenticationPrincipal(expression="realUser") UserLoginVO user
			, @RequestParam(value="page", required=false, defaultValue="1") int currentPage
			, @RequestParam(value="searchWord", required=false) String searchWord
			, HttpSession session
			, Model model
		) {
		String user_id = user.getUser_id();
		
		PagingVO<WebmailVO> pagingVO = settingList(currentPage, user_id, "inbox", searchWord);
		model.addAttribute("pagingVO", pagingVO);
		
		return pagingVO;
	}
	
	@RequestMapping("/lms/send.do")
	public String sendList(
			@AuthenticationPrincipal(expression="realUser") UserLoginVO user
			, @RequestParam(value="page", required=false, defaultValue="1") int currentPage
			, @RequestParam(value="searchWord", required=false) String searchWord
			, HttpSession session
			, Model model
	) {
		String user_id = user.getUser_id();
		StudentVO studentVO = studentService.student(user_id);
		StaffVO staffVO = lmsStaffService.staff(user_id);
		
		if(staffVO != null && studentVO == null) {
			session.setAttribute("userName", staffVO.getName());
			model.addAttribute("staff", staffVO);
		}else if(staffVO == null && studentVO != null) {
			session.setAttribute("userName", studentVO.getName());
			model.addAttribute("student", studentVO);
		}
		
		PagingVO<WebmailVO> pagingVO = settingList(currentPage, user_id, "send", searchWord);
		
		model.addAttribute("pagingVO", pagingVO);

		
		return  "lms/send";
	}
	
	@RequestMapping(value="/lms/send.do", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public PagingVO<WebmailVO> sendListForAjax(
			@AuthenticationPrincipal(expression="realUser") UserLoginVO user
			, @RequestParam(value="page", required=false, defaultValue="1") int currentPage
			, @RequestParam(value="searchWord", required=false) String searchWord
			, HttpSession session
			, Model model
		) {
		String user_id = user.getUser_id();
		
		PagingVO<WebmailVO> pagingVO = settingList(currentPage, user_id, "send", searchWord);
		model.addAttribute("pagingVO", pagingVO);
		
		return pagingVO;
	}
	
}
