package kr.ac.shms.lms.common.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.ac.shms.lecture.service.LectureService;
import kr.ac.shms.lms.login.vo.UserLoginVO;
import kr.ac.shms.lms.student.vo.SugangLecSTVO;
import kr.ac.shms.lms.student.vo.SugangVO;

/**
 * @author 박초원
 * @since  2021. 5. 21.  
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일        수정자         수정내용
 * --------     --------    ----------------------
 * 2021. 5. 21.  박초원      	최초작성
 * 2021. 5. 27.  김보미			강의개설버튼 조작을 위한 수정
 * 2021. 5. 28.  김보미			파일명 변경(lectureViewController->LectureViewController)
 * 2021. 5. 28.  김보미			수강중인 강의 목록 출력
 * 2021. 5. 29.  김보미         교수, 학생 구분 코드
 * 2021. 6. 20.  송수미         교수 전체 강의 조회
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */

@Controller
public class LectureViewController {
	
	@Inject
	private LectureService lectureService;
	
	@RequestMapping("/lms/lectureList.do")
	public String lectureList(
		@AuthenticationPrincipal(expression="realUser") UserLoginVO user
		, HttpSession session
		, Model model
	) {
		String user_id = user.getUser_id();
		String user_section = user.getUser_section();
		
		List<SugangLecSTVO> lecListST = lectureService.selectStudentSugangList(user_id);
		List<SugangLecSTVO> lecListPR = lectureService.selectProfessorSugangList(user_id);
		
		if("PR".equals(user.getUser_section())) {
			session.setAttribute("staff", user_section);
			model.addAttribute("lecListPR", lecListPR);
		}else if("ST".equals(user.getUser_section())) {
			session.setAttribute("student", user_section);
			model.addAttribute("lecListST", lecListST);
			
		}
		return "lms/lecture";
	}
	
	@RequestMapping("/lms/lectureAllList.do")
	public String lectureAllList(
			@AuthenticationPrincipal(expression="realUser") UserLoginVO user
			, Model model
		) {
		String staff_no = user.getUser_id();
		List<SugangVO> lecListPR = lectureService.selectAllLecList(staff_no);
		
		model.addAttribute("key", "key");
		model.addAttribute("lecListPR", lecListPR);
		
		return "lms/lecture";
	}
	
}
