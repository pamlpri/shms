package kr.ac.shms.lms.student.controller;

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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ac.shms.common.enumpkg.ServiceResult;
import kr.ac.shms.common.service.CommonService;
import kr.ac.shms.common.vo.LecScoreVO;
import kr.ac.shms.lms.common.service.LmsCommonService;
import kr.ac.shms.lms.common.vo.LecEvlResVO;
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
@RequestMapping("/lms")
public class EvaluationViewController {
	private static final Logger logger = LoggerFactory.getLogger(EvaluationViewController.class);
	@Inject
	private LmsCommonService lmsCommonService;
	
	@RequestMapping("/evaluation.do")
	public String evaluation(
		@AuthenticationPrincipal(expression="realUser") UserLoginVO user
		, Model model
	) {
//		List<LecScoreVO> selectLecEvlList = lmsCommonService.selectLecEvlList(user.getUser_id());
		List<LecScoreVO> selectLecEvlList = lmsCommonService.selectEvlCheck(user.getUser_id());
		model.addAttribute("selectLecEvlList", selectLecEvlList);
		
//		model.addAttribute("selectEvlCheck", result);
		
		return "lms/evaluation";
	}
	
	@RequestMapping(value="/insertEvaluation.do", method=RequestMethod.POST, produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public Map<String, String> insertEvaluation(
		@AuthenticationPrincipal(expression="realUser") UserLoginVO user
		, @RequestBody Map<Object, Object> evalData
	) {
		Map<String, String> res = new HashMap<>();
		for(int i=1; i<evalData.size(); i++) {
			LecEvlResVO lecEvlResVO = new LecEvlResVO();
			String name = "eval"+(i);
			lecEvlResVO.setQueitm_no((i));
			lecEvlResVO.setStdnt_no(user.getUser_id());
			lecEvlResVO.setLec_code((String) evalData.get("lecCode"));
			lecEvlResVO.setEvl_cont((String) evalData.get(name));
			
			ServiceResult result =  lmsCommonService.insertEvl(lecEvlResVO);
			if(ServiceResult.OK.equals(result)) {
				res.put("res", "OK");
			} else {
				res.put("res", "Fail");
			}
		}
		return res;
	}
}
