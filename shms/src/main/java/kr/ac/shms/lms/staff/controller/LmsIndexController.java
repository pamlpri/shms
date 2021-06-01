package kr.ac.shms.lms.staff.controller;
import java.util.ArrayList;
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

import kr.ac.shms.common.service.CommonService;
import kr.ac.shms.common.vo.RegInfoCngVO;
import kr.ac.shms.common.vo.StaffVO;
import kr.ac.shms.lecture.service.LectureProfessorService;
import kr.ac.shms.lecture.vo.LectureDetailsVO;
import kr.ac.shms.lecture.vo.SetTaskVO;
import kr.ac.shms.lms.common.service.LmsCommonService;
import kr.ac.shms.lms.common.vo.DietVO;
import kr.ac.shms.lms.login.vo.UserLoginVO;
import kr.ac.shms.lms.staff.service.LmsStaffService;
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
	private BoardService boardService;
	@Inject
	private LectureProfessorService lectureProfService;
	@Inject
	private LmsCommonService lmsCommonService;
	@Inject
	private CommonService commonService;
		
	@RequestMapping("/lms/main.do")
	public String index(
		@AuthenticationPrincipal(expression="realUser") UserLoginVO user
		, HttpSession session
		, Model model
	){	
		String user_id = user.getUser_id();
		StaffVO staffVO = lmsStaffService.staff(user_id);
		String authGrpCode = user.getAuth_grp_code();
		session.setAttribute("userName", staffVO.getName());
		Map<String, String> search;
		
		// 공통
		// 웹메일 정보 출력
		Map<String, String> webmailCntMap = lmsCommonService.selectWebmailCnt(user_id);
		model.addAttribute("webmailCntMap", webmailCntMap);
		
		// 오늘 학사일정 출력
		List<ScheduleVO> todaySchdulList = lmsCommonService.selectTodaySchdul();
		model.addAttribute("todaySchdulList", todaySchdulList);
		
		// 식단 정보 출력
		DietVO diet = lmsCommonService.selectDiet();
		model.addAttribute("diet", diet);
		
		// 교수
		if("PR".equals(authGrpCode)) {
			// 상담신청 건수 출력
			int consltCnt = lmsStaffService.selectConsltCnt(user_id);
			model.addAttribute("consltCnt", consltCnt);
			
			// Qna 건수 출력
			search = new HashMap<>();
			search.put("bo_name", "강의문의");
			search.put("staff_no", user_id);
			int QnaCnt = boardService.selectQnaCnt(search);
			model.addAttribute("QnaCnt", QnaCnt);
			
			// 강의공지 출력
			search.put("bo_name", "강의공지");
			List<BoardVO> ggList = boardService.selectForMain(search);
			model.addAttribute("ggList", ggList);
			
			// 강의 과제 출력
			List<SetTaskVO> taskList = lectureProfService.selectTask(user_id);
			model.addAttribute("taskList", taskList);
			
			// 오늘 강의 출력
			List<LectureDetailsVO> todayLecList	= lectureProfService.selectTodayLecList(user_id);
			model.addAttribute("todayLecList", todayLecList);
		}
		
		// 학생지원과
		if("HS".equals(authGrpCode)) {
			// 학교대관
			search = new HashMap<>();
			search.put("tb_name", "lecrum_use_req");
			search.put("additional", "use_tb_code");
			int lendCnt = commonService.selectCnt(search);
			model.addAttribute("lendCnt", lendCnt);
			
			// Qna
			search = new HashMap<>();
			search.put("bo_name", "대학문의");
			search.put("inqry_kind01", "학사일정문의");
			search.put("inqry_kind02", "편의시설문의");
			int QnaCnt = boardService.selectQnaCnt(search);
			model.addAttribute("QnaCnt", QnaCnt);
			
			// 학사공지 (최근 5개)
			search = new HashMap<>();
			search.put("bo_name", "학사공지");
			List<BoardVO> dgList = boardService.selectForMain(search);
			model.addAttribute("dgList", dgList);
			
			// 도서관 열람실 예약 (최근 5개)
			
			// 자료실 (최근 5개)
			search.put("bo_name", "자료실");
			List<BoardVO> jrList = boardService.selectForMain(search);
			model.addAttribute("jrList", jrList);
		}
		
		if("HJ".equals(authGrpCode)) {
			// 증명서 신청 건수
			search = new HashMap<>();
			search.put("tb_name", "crtf_req");
			int crtfCnt = commonService.selectCnt(search);
			model.addAttribute("crtfCnt", crtfCnt);
			
			// 등록금환불 신청 건수
			search.put("tb_name", "reg_fee_re");
			int regReCnt = commonService.selectCnt(search);
			model.addAttribute("regReCnt", regReCnt);
			
			// 학적변동신청 (최근 5개)
			List<RegInfoCngVO> regInfoCngList = commonService.SelectRegInfoCngList();
			model.addAttribute("regInfoCngList", regInfoCngList);
			
			// 고사 일정
		}
		
		if("CJ".equals(authGrpCode)) {
			// 장학 신청 건수
			search = new HashMap<>();
			search.put("tb_name", "schl_req");
			int schlCnt = commonService.selectCnt(search);
			model.addAttribute("schlCnt", schlCnt);
			
			// 장학 공지 (최근 5개)
			search.put("bo_name", "장학공지");
			List<BoardVO> jgList = boardService.selectForMain(search);
			model.addAttribute("jgList", jgList);
			
			// 진로 상담 건수
			search.put("tb_name", "conslt_req");
			search.put("staff_no", user_id);
			int consltCnt = commonService.selectCnt(search);
			model.addAttribute("consltCnt", consltCnt);
			
			
			// 진로 교육 (최근 5개)
			
			
		}
		
		logger.info("user : {}", user.toString());
		if(staffVO != null) {
			model.addAttribute("staff", staffVO);
		}
		return "lms/main";
	}
}
