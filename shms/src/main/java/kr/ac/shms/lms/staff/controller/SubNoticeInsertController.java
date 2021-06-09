package kr.ac.shms.lms.staff.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
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
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.multipart.MultipartFile;

import kr.ac.shms.common.enumpkg.ServiceResult;
import kr.ac.shms.common.service.BoardService;
import kr.ac.shms.common.vo.BoardVO;
import kr.ac.shms.common.vo.StaffVO;
import kr.ac.shms.lms.login.vo.UserLoginVO;
import kr.ac.shms.lms.staff.service.LmsStaffService;
import kr.ac.shms.validator.BoardInsertGroup;
/**
 * @author 박초원
 * @since 2021. 6. 8.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일           수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 6. 8.      박초원      	       최초작성
 * 2021. 6. 9.      송수미      	       학과 공지 게시글 등록 기능 구현
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Controller
public class SubNoticeInsertController {
	private static final Logger logger = LoggerFactory.getLogger(SubNoticeViewController.class);
	
	@Inject
	private LmsStaffService lmsStaffService;
	
	@Inject
	private BoardService boardService;
	
	@Inject
	private WebApplicationContext container;
	private ServletContext application;
	
	@Value("#{appInfo.boardFiles}")
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
	
	@RequestMapping("/lms/subjectNoticeInsert.do")
	public String subjectNoticeForm(
		@AuthenticationPrincipal(expression="realUser") UserLoginVO user
		, Model model
	) {
		String user_id = user.getUser_id();
		StaffVO staffVO = lmsStaffService.staff(user_id);
		
		model.addAttribute("staff", staffVO);
		return  "lms/subjectNoticeForm";
	}
	
	@RequestMapping(value="/lms/subjectNoticeInsert.do", method=RequestMethod.POST)
	public String subjectNoticeForm(
			@AuthenticationPrincipal(expression="realUser") UserLoginVO user
			, @Validated(BoardInsertGroup.class)
			@ModelAttribute("board") BoardVO board 
			, Errors errors
			, Model model
			) {
		String user_id = user.getUser_id();
		String user_name = user.getUser_name();
		StaffVO staffVO = lmsStaffService.staff(user_id);
		
		logger.info("board:{}", board);
		
		board.setBo_writer(user_name);
		String bo_kind = boardService.selectBoKind("학과공지");
		board.setBo_kind(bo_kind);
		String sub_code = user.getSub_code();
		board.setSub_code(sub_code);
		
		boolean valid = !(errors.hasErrors());
		String message = null;
		String view = null;
		
		if(valid) {
			ServiceResult result = boardService.insertBoard(board);
			if(ServiceResult.OK.equals(result)) {
				view = "redirect:/lms/subjectNoticeList.do";
			}else {
				message = "게시글 등록에 실패하였습니다. 잠시 후 다시 시도해주세요";
				view = "lms/subjectNoticeForm";
			}
		}else {
			message = "필수항목 누락";
			view = "lms/subjectNoticeForm";
		}
		
		logger.info("message : {}", message);
		model.addAttribute("message", message);
		model.addAttribute("staff", staffVO);
		return  view;
	}
	
	@RequestMapping(value="/lms/boardFiles.do", method=RequestMethod.POST, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public Map<String, Object> boardFiles(
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
