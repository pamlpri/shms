package kr.ac.shms.lms.common.controller;

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

import kr.ac.shms.common.service.BoardService;
import kr.ac.shms.common.vo.AttachVO;
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
 * 2021. 6. 4.		박초원		웹메일 조회 컨트롤러 최초작성
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Controller
@RequestMapping("/lms")
public class WebmailViewController {
	private static final Logger logger = LoggerFactory.getLogger(WebmailViewController.class);
	@Inject
	private StudentService studentService;
	
	@Inject
	private LmsStaffService lmsStaffService;
	
	@Inject
	private LmsCommonService lmsCommonService;
	
	@Inject
	private BoardService boardService;
		
	public PagingVO<WebmailVO> settingList(
			int currentPage
			, String user_id
			, String selectMenu
			, String searchWord
			) {
		
		PagingVO<WebmailVO> pagingVO = new PagingVO<>(10, 5);
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
	
	@RequestMapping("/inbox.do")
	public String inboxList(
		@AuthenticationPrincipal(expression="realUser") UserLoginVO user
		, @RequestParam(value="page", required=false, defaultValue="1") int currentPage
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
		
		PagingVO<WebmailVO> pagingVO = settingList(currentPage, user_id, "inbox", searchWord);
		
		model.addAttribute("pagingVO", pagingVO);
				
		return  "lms/inbox";
	}
	
	@RequestMapping(value="/inbox.do", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public PagingVO<WebmailVO> inboxListForAjax(
			@AuthenticationPrincipal(expression="realUser") UserLoginVO user
			, @RequestParam(value="page", required=false, defaultValue="1") int currentPage
			, @RequestParam(value="searchWord", required=false) String searchWord
			, Model model
		) {
		String user_id = user.getUser_id();
		
		PagingVO<WebmailVO> pagingVO = settingList(currentPage, user_id, "inbox", searchWord);
		model.addAttribute("pagingVO", pagingVO);
		
		return pagingVO;
	}
	
	@RequestMapping("/send.do")
	public String sendList(
			@AuthenticationPrincipal(expression="realUser") UserLoginVO user
			, @RequestParam(value="page", required=false, defaultValue="1") int currentPage
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
		
		PagingVO<WebmailVO> pagingVO = settingList(currentPage, user_id, "send", searchWord);
		
		model.addAttribute("pagingVO", pagingVO);

		
		return  "lms/send";
	}
	
	@RequestMapping(value="/send.do", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public PagingVO<WebmailVO> sendListForAjax(
			@AuthenticationPrincipal(expression="realUser") UserLoginVO user
			, @RequestParam(value="page", required=false, defaultValue="1") int currentPage
			, @RequestParam(value="searchWord", required=false) String searchWord
			, Model model
		) {
		String user_id = user.getUser_id();
		
		PagingVO<WebmailVO> pagingVO = settingList(currentPage, user_id, "send", searchWord);
		model.addAttribute("pagingVO", pagingVO);
		
		return pagingVO;
	}
	
	@RequestMapping(value="/webmailView.do", method=RequestMethod.POST)
	public String webmailView(
		@AuthenticationPrincipal(expression="realUser") UserLoginVO user
		, @RequestParam("send_no") int send_no
		, @RequestParam("selectMenu") String selectMenu
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
		
		Map<String, Object> search = new HashMap<>();
		search.put("send_no", send_no);
		search.put("selectMenu", selectMenu);
		WebmailVO webmail =  lmsCommonService.selectWebmail(search);
		model.addAttribute("webmail", webmail);
		model.addAttribute("selectMenu", selectMenu);
		
		return "lms/webmailView";
	}
	
	@RequestMapping(value="/webmailDownload.do")
	public String downloader(
		@ModelAttribute("attach") AttachVO attach
		, Model model
	) {
		AttachVO attvo = boardService.download(attach);
		model.addAttribute("attvo", attvo);		
		return "downloadView";
	}
}
