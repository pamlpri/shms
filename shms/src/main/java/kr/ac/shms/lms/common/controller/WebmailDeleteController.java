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
	public ServiceResult webmailDelete(
		@RequestParam("deletenos[]") List<Integer> deletenos
		, @RequestParam("selectMenu") String selectMenu
	) {
		
		logger.info("deletenos : {}", deletenos.toString());
		logger.info("selectMenu : {}", selectMenu);
		
		Map<String, Object> search = new HashMap<>();
		search.put("selectMenu", selectMenu);
		search.put("deletenos", deletenos);
		
		ServiceResult result = lmsCommonService.deleteWebmail(search);
		
		return result;
	}
}
