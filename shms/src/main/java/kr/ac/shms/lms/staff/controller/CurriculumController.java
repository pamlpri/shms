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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.ac.shms.common.dao.OthersDAO;
import kr.ac.shms.common.enumpkg.ServiceResult;
import kr.ac.shms.common.service.CommonAttachService;
import kr.ac.shms.common.vo.AttachVO;
import kr.ac.shms.common.vo.CurriculumVO;
import kr.ac.shms.common.vo.LecrumVO;
import kr.ac.shms.common.vo.PagingVO;
import kr.ac.shms.common.vo.SubjectVO;
import kr.ac.shms.lms.common.service.LmsCommonService;
import kr.ac.shms.lms.common.vo.UserVO;
import kr.ac.shms.lms.student.vo.LectureVO;
import kr.ac.shms.validator.CurriculumInsertGroup;
import kr.ac.shms.validator.LectureRegisterGroup;

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
 * 2021. 6. 23.      송수미      	       커리큘럼 등록 기능 구현
 * 2021. 6. 24.      송수미      	       커리큘럼  조회 기능 구현
 * 2021. 6. 25.      송수미      	      강의 등록   
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
	@Inject
	private CommonAttachService commonAttachService;
	
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
		addAttribute(model);
		
		PagingVO<CurriculumVO> pagingVO = curriculumForAjax(lecCl, 1, null, null, null, null, model, sessionStatus);
		model.addAttribute("pagingVO", pagingVO);
		
		return "lms/curriculum";
	}
	
	@RequestMapping(value="/lms/curriculum.do", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public PagingVO<CurriculumVO> curriculumForAjax(
		@RequestParam("key") String lecCl
		, @RequestParam(value="page", required=false, defaultValue="1") int currentPage
		, @RequestParam(value="searchWord", required=false) String searchWord
		, @RequestParam(value="sub_code", required=false) String sub_code
		, @RequestParam(value="posbl_semstr", required=false) Integer posbl_semstr
		, @RequestParam(value="open_at", required=false) String open_at
		, Model model
		, SessionStatus sessionStatus
		) {
		addAttribute(model);
		
		PagingVO<CurriculumVO> pagingVO = new PagingVO<>(10, 5);
		pagingVO.setCurrentPage(currentPage);
		
		Map<String, Object> searchMap = new HashMap<>();
		searchMap.put("searchWord", searchWord);
		searchMap.put("lecCl", lecCl);
		searchMap.put("sub_code", sub_code);
		searchMap.put("posbl_semstr", posbl_semstr);
		searchMap.put("open_at", open_at);
		pagingVO.setSearchMap(searchMap);
		
		int totalRecord = lmsCommonService.selectCurrCount(pagingVO);
		pagingVO.setTotalRecord(totalRecord);
		
		List<CurriculumVO> currList = lmsCommonService.selectCurrList(pagingVO);
		pagingVO.setDataList(currList);
		model.addAttribute("pagingVO", pagingVO);
		model.addAttribute("lecCl", lecCl);
		model.addAttribute("searchWord", searchWord);
		sessionStatus.setComplete();
		return pagingVO;
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
		
		/** 시연용 데이터 넣기 */
		CurriculumVO curriculum = new CurriculumVO();
		curriculum.setLec_name("빅데이터와경영");
		curriculum.setStaff_no("P19101001");
		curriculum.setName("강숙자");
		curriculum.setPosbl_semstr(2);
		curriculum.setLec_cl("01");
		curriculum.setLec_cpacity(5);
		curriculum.setLec_pnt(3);
		curriculum.setCol_code("1");
		curriculum.setSub_code("101");
		model.addAttribute("curriculum", curriculum);
		/** 끝 */
		
		
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
			if(curriculum.getLec_cpacity() < 5 || curriculum.getLec_cpacity() > 100) {
				message = "강의 정원은 5명 이상 100명 이하로 설정 가능합니다.";
				view = "lms/curriculumForm";
			}else if(curriculum.getLec_pnt() < 1 || curriculum.getLec_pnt() > 4) {
				message = "학점은 1학점 이상 4학점 이하로 설정 가능합니다.";
				view = "lms/curriculumForm";
			}else {
				ServiceResult result = lmsCommonService.insertCurriculum(curriculum);
				
				if(ServiceResult.OK.equals(result)) {
					view = "redirect:/lms/curriculum.do?key=major";
				}else {
					message = "커리큘럼 등록에 실패하였습니다. 잠시 후 다시 시도해주세요";
					view = "lms/curriculumForm";
				}
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
	public String curriculumView(
		@RequestParam("cur_code") String cur_code
		, Model model
		) {
		LectureVO lecture = lmsCommonService.selectLecture(cur_code);

		if(lecture == null) {
			model.addAttribute("message", "강의가 개설되었던 이력이 없습니다.");
			model.addAttribute("cur_code", cur_code);
		}
		
		model.addAttribute("lecture", lecture);
		
		return "lms/curriculumView";
	}
	
	@RequestMapping("/lms/lectureRegister.do")
	public String lectureRegisterForm(
		@RequestParam("cur_code") String cur_code
		, Model model	
		) {
		List<CurriculumVO> indexInfoList = lmsCommonService.selectCurIndexInfo();
		CurriculumVO curr = lmsCommonService.selectCurriculum(cur_code);
		
		model.addAttribute("indexInfoList", indexInfoList);
		model.addAttribute("curr", curr);
		
		return "lms/lecRegForm";
	}
	
	@RequestMapping(value="/lms/lectureRegister.do", method=RequestMethod.POST)
	public String lectureRegister(
			@Validated(LectureRegisterGroup.class)
			@ModelAttribute("lecture") LectureVO lecture
			, Errors errors
			, Model model	
			) {
		logger.info("lecture : {}", lecture.toString());
		List<CurriculumVO> indexInfoList = lmsCommonService.selectCurIndexInfo();
		CurriculumVO curr = lmsCommonService.selectCurriculum(lecture.getCur_code());
		boolean valid = !errors.hasErrors();
		String message = null;
		String view = null;
		
		if(valid) {
			ServiceResult result = lmsCommonService.insertLecture(lecture);
			
			if(ServiceResult.OK.equals(result)) {
				view = "redirect:/lms/curriculum.do?key=major";
			}else {
				message = "강의 등록에 실패했습니다. 잠시 후 다시 시도해주세요.";
				view = "lms/lecRegForm";
			}
		}else {
			message = "빠뜨린 내용이 있는지 확인해주세요.";
			view = "lms/lecRegForm";
		}
		
		model.addAttribute("indexInfoList", indexInfoList);
		model.addAttribute("curr", curr);
		model.addAttribute("lecture", lecture);
		model.addAttribute("message", message);
		
		return view;
	}
	
	@RequestMapping(value="/lms/staffSchdulCheck.do", produces=MediaType.TEXT_PLAIN_VALUE)
	@ResponseBody
	public String staffSchdulChk(
		@RequestParam("lecTime") Integer lecTime
		, @RequestParam("lec_pnt") Integer lec_pnt
		, @RequestParam("staff_no") String staff_no
		, @RequestParam("dayotw") String dayotw
		) {
		String result = "FAIL";
		Map<String, Object> searchMap = new HashMap<>();
		if(lecTime != null) {
			int[] timeArray = new int[lec_pnt];
			for(int i = 0; i < lec_pnt; i++) {
				timeArray[i] = lecTime + i;
			}
			searchMap.put("timeArray", timeArray);
			searchMap.put("staff_no", staff_no);
			searchMap.put("dayotw", dayotw);
			
			int cnt = lmsCommonService.selectStaffSchdulChk(searchMap);
			if(cnt <= 0) {
				result = "OK";
			}
		}else {
			result = "NULL";
		}
		return result;
	}
	
	@RequestMapping(value="/lms/lecRumInfo.do", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public List<LecrumVO> lecrumInfo(
			@RequestParam("lecCpacity") Integer lecCpacity
			, @RequestParam("subCode") String subCode
			, @RequestParam("dayotw") String dayotw
			, @RequestParam("lecTime") Integer lecTime
			, @RequestParam("lecPnt") Integer lecPnt
		) {
		
		Map<String, Object> searchMap = new HashMap<>();
		int endTime = lecTime + lecPnt - 1;
		searchMap.put("lec_cpacity", lecCpacity);
		searchMap.put("sub_code", subCode);
		searchMap.put("dayotw", dayotw);
		searchMap.put("lec_time", lecTime);
		searchMap.put("end_time", endTime);
		searchMap.put("search", "first");
		
		List<LecrumVO> lecrum = lmsCommonService.selectLecrumInfo(searchMap);
		if(lecrum == null) {
			searchMap.put("search", "second");
			lecrum = lmsCommonService.selectLecrumInfo(searchMap);
		}
		
		return lecrum;
	}
	
	@RequestMapping("/lms/curriculumDownload.do")
	public String downloader(
		@ModelAttribute("lecture") AttachVO attachVO
		, Model model
		) {
		AttachVO attvo = commonAttachService.download(attachVO, null);
		model.addAttribute("attvo", attvo);
		
		return "downloadView";
	}
	
	@RequestMapping("/lms/curriculumDelete.do")
	public String curriculumDelete(
		@RequestParam("cur_code") String cur_code
		, RedirectAttributes session
		) {
		logger.info("cur_code : {}", cur_code);
		
		int lecCnt = lmsCommonService.selectRegisteredLecCnt(cur_code);
		String message = null;
		String view = null;
		
		if(lecCnt > 0) {
			message = "현재 학기에 등록되어 있는 강의는 삭제가 불가능합니다.";
			view = "redirect:/lms/curriculumView.do?cur_code=" + cur_code;
		}else {
			ServiceResult result = lmsCommonService.deleteCurriculum(cur_code);
			
			if(ServiceResult.OK.equals(result)) {
				view = "redirect:/lms/curriculum.do?key=major";
			}else {
				message = "삭제에 실패하였습니다. 잠시 후 다시 시도해주세요";
				view = "redirect:/lms/curriculumView.do?cur_code=" + cur_code;
			}
		}
		
		session.addFlashAttribute("message", message);
		return view;
	}
}
