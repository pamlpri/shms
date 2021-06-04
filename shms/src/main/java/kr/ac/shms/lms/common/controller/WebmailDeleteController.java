package kr.ac.shms.lms.common.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.ac.shms.common.enumpkg.ServiceResult;
import kr.ac.shms.lms.common.service.LmsCommonService;

/**
 * @author 송수미
 * @since 2021. 6. 4.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 6. 4.      송수미       최초작성
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Controller
public class WebmailDeleteController {
	private static final Logger logger = LoggerFactory.getLogger(WebmailDeleteController.class);
	
	@Inject
	private	LmsCommonService lmsCommonService; 
	
	@RequestMapping(value="/lms/webmailDelete.do", method=RequestMethod.POST ,produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ServiceResult webmailDeleteForAjax(
		@RequestParam("deletenos[]") List<Integer> deletenos
		, @RequestParam("selectMenu") String selectMenu
	) {
		
		Map<String, Object> search = new HashMap<>();
		search.put("selectMenu", selectMenu);
		search.put("deletenos", deletenos);
		
		ServiceResult result = lmsCommonService.deleteWebmail(search);
		
		return result;
	}
	
	@RequestMapping("/lms/webmailDelete.do")
	public String webmailDelete(
		@RequestParam("send_no") int send_no
		, @RequestParam("selectMenu") String selectMenu
		, RedirectAttributes session
	) {
		
		Map<String, Object> search = new HashMap<>();
		search.put("selectMenu", selectMenu);
		search.put("send_no", send_no);
		
		ServiceResult result = lmsCommonService.deleteWebmail(search);
		String message = null;
		String view = null;
		
		if(ServiceResult.OK == result) {
			message = "성공적으로 삭제되었습니다.";
			view = "redirect:/lms/" + selectMenu + ".do";
		}else {
			message = "성공 실패! 잠시 후 다시 시도해주세요.";
			view = "redirect:/lms/webmailView.do?send_no=" + send_no + "&selectMenu=" + selectMenu;
		}
		session.addFlashAttribute("message", message);
		
		return view;
	}
}
