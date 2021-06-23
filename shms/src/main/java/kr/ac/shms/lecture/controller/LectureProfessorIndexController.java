package kr.ac.shms.lecture.controller;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import kr.ac.shms.common.service.BoardService;
import kr.ac.shms.common.vo.BoardVO;
import kr.ac.shms.common.vo.PagingVO;
import kr.ac.shms.lecture.service.LectureService;
import kr.ac.shms.lms.student.vo.LectureVO;

/**
 * @author 박초원
 * @since 2021. 5. 21.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일         수정자        수정내용
 * --------     --------    ----------------------
 * 2021. 5. 21.  박초원        최초작성
 * 2021. 5. 26.  김보미        수정
 * 2021. 5. 27.  김보미        교수전용페이지로 이동하기 위한 수정
 * 2021. 5. 29.  김보미        교수용 강의 정보
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */

@Controller
@SessionAttributes({"lec_code", "lec_name"})
public class LectureProfessorIndexController {
	private static final Logger logger = LoggerFactory.getLogger(LectureProfessorIndexController.class);
	@Inject
	private LectureService lectureService;
	@Inject
	private BoardService boardService;
	
	
	@RequestMapping("/lecture/main.do")
	public String lectureDetailsPR(
			@RequestParam("lec_code") String lec_code
			, @RequestParam("lec_name") String lec_name
			, Model model
			) {
		PagingVO<BoardVO> pagingVO = new PagingVO<>();
		Map<String, Object> searchMap = new HashMap<>();
		searchMap.put("bo_kind", "GG");
		searchMap.put("lec_code", lec_code);
		pagingVO.setSearchMap(searchMap);
		int ggCnt = boardService.selectBoardCount(pagingVO);
		
		searchMap.put("bo_kind", "GM");
		pagingVO.setSearchMap(searchMap);
		int gmCnt = boardService.selectBoardCount(pagingVO);
		
		LectureVO lectureDetails = lectureService.selectLectureDetails(lec_code);
		LectureVO lectureDiary = lectureService.selectLecDiary(lec_code);
		
        model.addAttribute("lecture", lectureDetails);
        model.addAttribute("lectureDiary", lectureDiary);
        model.addAttribute("lec_code", lec_code);
        model.addAttribute("lec_name", lec_name);
        model.addAttribute("ggCnt", ggCnt);
        model.addAttribute("gmCnt", gmCnt);
        
		return "lecture/main";
		
	}

}
