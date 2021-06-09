package kr.ac.shms.lms.staff.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.PostConstruct;
import javax.inject.Inject;
import javax.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.MediaType;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.multipart.MultipartFile;

import kr.ac.shms.common.enumpkg.ServiceResult;
import kr.ac.shms.lms.login.vo.UserLoginVO;
import kr.ac.shms.lms.staff.service.LmsStaffService;
import kr.ac.shms.lms.student.vo.ConsultingVO;

/**
 * @author 박초원
 * @since 2021. 6. 7.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                  수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 6. 7.      박초원      	       최초작성
 * 2021. 6. 7.		최희수		상담 내역
 * 2021. 6. 9.	   박초원        ckeditor 적용 
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Controller
@RequestMapping("/lms")
public class ConsultingAdminController {
	private static final Logger logger = LoggerFactory.getLogger(ConsultingAdminController.class);
	@Inject
	private LmsStaffService lmsStaffService;
	
	@Inject
	private WebApplicationContext container;
	private ServletContext application;
	
	@Value("#{appInfo.consultingFiles}")
	private String saveFolderURL;
	
	private String saveFolderPath;
	
	private File saveFolder;
	
	@PostConstruct
	public void init() {
		application = container.getServletContext();
		saveFolderPath = application.getRealPath(saveFolderURL);
		saveFolder = new File(saveFolderPath);
		logger.info("{} 초기화, {} 주입됨.", getClass().getSimpleName(), saveFolder.getAbsolutePath());
	}
	
	@RequestMapping("/consultingAdmin.do")
	public String sendForm (
		@AuthenticationPrincipal(expression="realUser") UserLoginVO user
		, Model model
	){
		String user_id = user.getUser_id();
		
		List<ConsultingVO> consultingList = lmsStaffService.consultingList(user_id);
		
		model.addAttribute("consultingList", consultingList);
		
		return  "lms/consultingAdmin";
	}
	
	@RequestMapping(value="/consultingAdmin.do", method=RequestMethod.POST)
	public String consultingUpdate(
			@ModelAttribute("consulting") ConsultingVO consultingVO
			, @RequestParam("approval") String approval
		) {
		ServiceResult result = null;
		if("companion".equals(approval)) {	// 상담 반려일 경우
			result = lmsStaffService.consultingCompanion(consultingVO);
		} else if("approval".equals(approval)) {	// 상담 승인일 경우
			result = lmsStaffService.consultingApproval(consultingVO.getReq_no());
		}
		
		String view = null;
		if(ServiceResult.OK.equals(result)) {
			view = "redirect:/lms/consultingAdmin.do";
		}
		return view;
	}
	
	@RequestMapping(value="/consultingFiles.do", method=RequestMethod.POST, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public Map<String, Object> consultingFiles(
			@RequestPart("upload") MultipartFile upload
	) throws IOException {
		
		if(!saveFolder.exists()) {
			saveFolder.mkdirs(); 
		}
		
		Map<String, Object> resultMap = new HashMap<>();
		if(!upload.isEmpty()) {
			String saveName = UUID.randomUUID().toString();
			upload.transferTo(new File(saveFolder, saveName));
			int uploaded = 1;
			String fileName = upload.getOriginalFilename();
			String url = application.getContextPath() + saveFolderURL + "/" + saveName;
			resultMap.put("uploaded", uploaded);
			resultMap.put("fileName", fileName);
			resultMap.put("url", url);
		}
		
		return resultMap;
	}
}
