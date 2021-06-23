package kr.ac.shms.lms.staff.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import kr.ac.shms.common.dao.OthersDAO;
import kr.ac.shms.common.enumpkg.ServiceResult;
import kr.ac.shms.common.vo.CurriculumVO;
import kr.ac.shms.common.vo.SubjectVO;
import kr.ac.shms.lms.common.service.LmsCommonService;
import kr.ac.shms.lms.common.vo.UserVO;
import kr.ac.shms.validator.CurriculumInsertGroup;

/**
 * @author 박초원
 * @since 2021. 6. 23.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                  수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 6. 23.      박초원      	       최초작성
 * 2021. 6. 23.      송수미      	       커리큘럼 등록, 조회 기능 구현
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Controller
@SessionAttributes({"lecCl"})
public class CurriculumController {
	private static final Logger logger = LoggerFactory.getLogger(CurriculumController.class);
	@Inject
	private LmsCommonService lmsCommonService;
	@Inject
	private OthersDAO othersDAO;
	
	private void addAttribute(Model model) {
		List<Map<String, Object>> collegeList = othersDAO.selectCollegeList();
		List<SubjectVO> subjectList = othersDAO.selectSubjectList(null);
		List<CurriculumVO> indexInfoList = lmsCommonService.selectCurIndexInfo();
		model.addAttribute("collegeList", collegeList);
		model.addAttribute("subjectList", subjectList);
		model.addAttribute("indexInfoList", indexInfoList);
	}
	
	@RequestMapping("/lms/curriculum.do")
	public String curriculum(
		@RequestParam("key") String lecCl
		, Model model
		, SessionStatus sessionStatus
		) {
		
		
		model.addAttribute("lecCl", lecCl);
		sessionStatus.setComplete();
		return "lms/curriculum";
	}
	
	@RequestMapping(value="/lms/lectureSearch.do", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public List<CurriculumVO> lectureSearch(
		@SessionAttribute("lecCl") String lecCl
		, @RequestParam(value="searchType", required=false) String searchType
		, @RequestParam(value="searchWord", required=false) String searchWord
		) {
		
		/** 파라미터 조회 */
		/** 검색 조건 */
		CurriculumVO curr = new CurriculumVO();
		Map<String, Object> searchMap = new HashMap<>();
		searchMap.put("searchType", searchType);
		searchMap.put("searchWord", searchWord);
		searchMap.put("lecCl", lecCl);
		curr.setSearchMap(searchMap);
		
		/** 서비스 호출 */
		List<CurriculumVO> currList = lmsCommonService.selectCurrInfo(curr);
		
		
		/** 반환 */
		return currList;
	}
	
	@RequestMapping(value="/lms/profSearch.do", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public List<UserVO> profSearch(
			@RequestParam(value="searchType", required=false) String searchType
			, @RequestParam(value="searchWord", required=false) String searchWord
			) {
		
		/** 파라미터 조회 */
		/** 검색 조건 */
		UserVO user = new UserVO();
		Map<String, Object> searchMap = new HashMap<>();
		searchMap.put("searchType", searchType);
		searchMap.put("searchWord", searchWord);
		user.setSearchMap(searchMap);
		
		/** 서비스 호출 */
		List<UserVO> userList = lmsCommonService.selectProfSearch(user);
		
		/** 반환 */
		return userList;
		
	}
	
	@RequestMapping("/lms/curriculumInsert.do")
	public String curriculumForm(
		Model model
		) {
		addAttribute(model);
		
		/** 반환 */
		return "lms/curriculumForm";
	}
	
	@RequestMapping(value="/lms/curriculumInsert.do", method=RequestMethod.POST)
	public String curriculumInsert(
		@Validated(CurriculumInsertGroup.class)
		@ModelAttribute("curriculum") CurriculumVO curriculum	
		, Errors errors
		, Model model
		) {
		addAttribute(model);
		String message = null;
		String view = null;
		boolean valid = !errors.hasErrors();
		
		if(valid) {
			ServiceResult result = lmsCommonService.insertCurriculum(curriculum);
			
			if(ServiceResult.OK.equals(result)) {
				view = "redirect:/lms/curriculum.do?key=major";
			}else {
				message = "커리큘럼 등록에 실패하였습니다. 잠시 후 다시 시도해주세요";
				view = "lms/curriculumForm";
			}
		}else {
			message = "입력하지 않은 항목이 있는지 확인 후 다시 시도해주세요.";
			view = "lms/curriculumForm";
		}
		
		model.addAttribute("message", message);
		model.addAttribute("curriculum", curriculum);
		return view;
	}
	
	@RequestMapping("/lms/curriculumView.do")
	public String curriculumView() {
		return "lms/curriculumView";
	}
}
