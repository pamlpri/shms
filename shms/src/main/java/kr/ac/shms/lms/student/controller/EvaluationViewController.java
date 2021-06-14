package kr.ac.shms.lms.student.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.ac.shms.common.service.CommonService;
import kr.ac.shms.common.vo.LecScoreVO;
import kr.ac.shms.lms.common.service.LmsCommonService;
import kr.ac.shms.lms.login.vo.UserLoginVO;

/**
 * @author 박초원
 * @since 2021. 6. 9.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                  수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 6. 9.      박초원      	       최초작성
 * 2021. 6. 14		최희수		강의평가 조회
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Controller
public class EvaluationViewController {
	private static final Logger logger = LoggerFactory.getLogger(EvaluationViewController.class);
	@Inject
	private LmsCommonService lmsCommonService;
	
	@RequestMapping("/lms/evaluation.do")
	public String evaluation(
		@AuthenticationPrincipal(expression="realUser") UserLoginVO user
		, Model model
	) {
		List<LecScoreVO> selectLecEvlList = lmsCommonService.selectLecEvlList(user.getUser_id());
		model.addAttribute("selectLecEvlList", selectLecEvlList);
		
		int selectEvlCnt = lmsCommonService.selectEvlCnt(user.getUser_id());
		model.addAttribute("selectEvlCnt", selectEvlCnt);
		return "lms/evaluation";
	}
}
