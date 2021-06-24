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

import kr.ac.shms.common.dao.CommonDAO;
import kr.ac.shms.common.service.CommonService;
import kr.ac.shms.common.vo.LecScoreVO;
import kr.ac.shms.lms.common.service.LmsCommonService;
import kr.ac.shms.lms.login.vo.UserLoginVO;
import kr.ac.shms.lms.student.service.CertificateService;
import kr.ac.shms.lms.student.service.StudentService;
import kr.ac.shms.lms.student.vo.CertificateReqVO;
/**
 * @author 김보미
 * @since 2021. 6. 9.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일        수정자       수정내용
 * --------     --------    ----------------------
 * 2021. 6. 9.   김보미       최초작성
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Controller
public class CrtfScoreController {
	private static final Logger logger =LoggerFactory.getLogger(CrtfScoreController.class);
	@Inject
	private CertificateService certificateService;
	@Inject
	private CommonService commonService;
	@Inject
	private CommonDAO commonDAO;
	
	@RequestMapping("/lms/scoreCertificate.do")
	public String scoreCertificate(
		@AuthenticationPrincipal(expression="realUser") UserLoginVO user
		, @RequestParam("req_no") int req_no
		, Model model	
		) {
		CertificateReqVO crtf = new CertificateReqVO();
		crtf.setReq_no(req_no);
		crtf.setStdnt_no(user.getUser_id());
		crtf = certificateService.selectCrtfPrint(crtf);
		
		LecScoreVO lecScore = new LecScoreVO();
		lecScore.setStdnt_no(user.getUser_id());
		
		List<LecScoreVO> lecScoreList = commonService.lecScoreList(lecScore);
		model.addAttribute("lecScoreList", lecScoreList);
		System.out.println("*******************************");
		logger.info("lecScoreList {}", lecScoreList);
		
		List<LecScoreVO> selectSemstrList = commonService.selectSemstrList(lecScore);
		model.addAttribute("selectSemstrList", selectSemstrList);
		
		model.addAttribute("crtf", crtf);
		
		List<LecScoreVO> selectYearList = commonDAO.selectLecYear(user.getUser_id());
		model.addAttribute("selectYearList", selectYearList);
		
//		List<LecScoreVO> selectStatisticsList = commonService.selectStatisticsList();
		return "lms/certificate/score2";
	}
}
