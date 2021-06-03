package kr.ac.shms.lms.common.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.ac.shms.common.vo.StaffVO;
import kr.ac.shms.lms.common.service.LmsCommonService;
import kr.ac.shms.lms.common.vo.WebmailVO;
import kr.ac.shms.lms.login.vo.UserLoginVO;
import kr.ac.shms.lms.staff.service.LmsStaffService;
import kr.ac.shms.lms.student.service.StudentService;
import kr.ac.shms.lms.student.vo.StudentVO;
import kr.ac.shms.main.commuity.vo.PagingVO;
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
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Controller
public class WebmailViewController {
	@Inject
	private StudentService studentService;
	
	@Inject
	private LmsStaffService lmsStaffService;
	
	@Inject
	private LmsCommonService lmsCommonService;
	
	@RequestMapping("/lms/inbox.do")
	public String inboxList(
		@AuthenticationPrincipal(expression="realUser") UserLoginVO user
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
		
		PagingVO<WebmailVO> pagingVO = new PagingVO<>();
		pagingVO.setCurrentPage(1);
		
		Map<String, Object> searchMap = new HashMap<>();
		searchMap.put("user_id", user_id);
		searchMap.put("selectMenu", "inbox");
		pagingVO.setSearchMap(searchMap);
		
		int totalRecord = lmsCommonService.selectWebmailtotalCnt(pagingVO);
		pagingVO.setTotalRecord(totalRecord);
		
		List<WebmailVO> webmailList = lmsCommonService.selectWebmailList(pagingVO);
		pagingVO.setDataList(webmailList);
		model.addAttribute("pagingVO", pagingVO);
		
		return  "lms/inbox";
	}
	
	@RequestMapping("/lms/send.do")
	public String sendList(
		@AuthenticationPrincipal(expression="realUser") UserLoginVO user
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
		
		return  "lms/send";
	}
}
