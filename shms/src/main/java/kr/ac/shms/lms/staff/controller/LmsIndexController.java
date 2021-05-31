package kr.ac.shms.lms.staff.controller;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.ac.shms.common.vo.StaffVO;
import kr.ac.shms.lecture.service.LectureService;
import kr.ac.shms.lecture.vo.LectureDetailsVO;
import kr.ac.shms.lecture.vo.SetTaskVO;
import kr.ac.shms.lms.common.service.LmsCommonService;
import kr.ac.shms.lms.common.vo.DietVO;
import kr.ac.shms.lms.login.vo.UserLoginVO;
import kr.ac.shms.lms.staff.service.LmsStaffService;
import kr.ac.shms.lms.student.service.StudentService;
import kr.ac.shms.main.commuity.service.BoardService;
import kr.ac.shms.main.commuity.vo.BoardVO;
import kr.ac.shms.main.commuity.vo.ScheduleVO;
/**
 * @author 최희수
 * @since 2021. 05. 22.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 05. 22.  최희수          최초작성
 * 2021. 05. 26.  최희수          사용자명을 session 에 저장
 * 2021. 05. 31.  송수미          교수 통합정보시스템 메인페이지 구현
 * Copyright (c) ${year} by DDIT All right reserved
 * </pre>
 */
@Controller
public class LmsIndexController {
	private static final Logger logger = LoggerFactory.getLogger(LmsIndexController.class);
	@Inject
	private LmsStaffService lmsStaffService;
	@Inject
	private StudentService studentService;
	@Inject
	private BoardService boardService;
	@Inject
	private LectureService lectureService;
	@Inject
	private LmsCommonService lmsCommonService;
		
	@RequestMapping("/lms/main.do")
	public String index(
		@AuthenticationPrincipal(expression="realUser") UserLoginVO user
		, HttpSession session
		, Model model
	){
		String user_id = user.getUser_id();
		StaffVO staffVO = lmsStaffService.staff(user_id);
		session.setAttribute("userName", staffVO.getName());
		
		// 웹메일 정보 출력
		Map<String, String> webmailCntMap = lmsCommonService.selectWebmailCnt(user_id);
		model.addAttribute("webmailCntMap", webmailCntMap);
		
		// 상담신청 건수 출력
		int consltCnt = lmsStaffService.selectConsltCnt(user_id);
		model.addAttribute("consltCnt", consltCnt);
		
		// 강의공지 출력
		Map<String, String> search = new HashMap<>();
		search.put("bo_name", "강의공지");
		search.put("staff_no", user_id);
		List<BoardVO> ggList = boardService.selectForMain(search);
		model.addAttribute("ggList", ggList);
		
		// 강의 과제 출력
		List<SetTaskVO> taskList = lectureService.selectTask(user_id);
		model.addAttribute("taskList", taskList);
		
		// 오늘 강의 출력
		List<LectureDetailsVO> todayLecList	= lectureService.selectTodayLecList(user_id);
		model.addAttribute("todayLecList", todayLecList);
		
		// 오늘 학사일정 출력
		List<ScheduleVO> todaySchdulList = lmsCommonService.selectTodaySchdul();
		model.addAttribute("todaySchdulList", todaySchdulList);
		
		// 식단 정보 출력
		DietVO diet = lmsCommonService.selectDiet();
		model.addAttribute("diet", diet);
		
		if(staffVO != null) {
			model.addAttribute("staff", staffVO);
		}
		return "lms/main";
	}
}
