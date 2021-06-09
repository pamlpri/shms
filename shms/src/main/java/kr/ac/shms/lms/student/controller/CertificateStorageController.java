package kr.ac.shms.lms.student.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.ac.shms.common.vo.BoardVO;
import kr.ac.shms.common.vo.PagingVO;
import kr.ac.shms.lms.common.controller.WebmailInsertController;
import kr.ac.shms.lms.login.vo.UserLoginVO;
import kr.ac.shms.lms.student.service.CertificateService;
import kr.ac.shms.lms.student.service.StudentService;
import kr.ac.shms.lms.student.vo.CertificateReqVO;
import kr.ac.shms.lms.student.vo.StudentVO;

/**
 * @author 박초원
 * @since 2021. 6. 3.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일        수정자       수정내용
 * --------     --------    ----------------------
 * 2021. 6. 3.   박초원       최초작성
 * 2021. 6. 7.   김보미       증명서보관함 내역 조회
 * 2021. 6. 9.   김보미		  증명서 출력을 위한 데이터 전달 
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Controller
public class CertificateStorageController {
	private static final Logger logger = LoggerFactory.getLogger(WebmailInsertController.class);
	
	@Inject
	private StudentService studentService;
	
	@Inject
	private CertificateService certificafeService;
	
	@RequestMapping("/lms/certificateStorage.do")
	public String certificatePay(
		@RequestParam(value="page", required=false, defaultValue="1") int currentPage
		, @AuthenticationPrincipal(expression="realUser") UserLoginVO user
		, Model model
	) {
		StudentVO studentVO = studentService.student(user.getUser_id());
		
		List<CertificateReqVO> crtfList = certificafeService.selectCrtfList(user.getUser_id());
		model.addAttribute("crtfList", crtfList);
		model.addAttribute("student", studentVO);
		
		return "lms/certificateStorage";
	}
}