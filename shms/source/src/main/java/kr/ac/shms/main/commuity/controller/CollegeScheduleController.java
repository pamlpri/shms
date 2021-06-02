package kr.ac.shms.main.commuity.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ac.shms.main.commuity.service.CalendarService;
import kr.ac.shms.main.commuity.vo.ComCodeVO;
import kr.ac.shms.main.commuity.vo.EventWrapper;
import kr.ac.shms.main.commuity.vo.ScheduleVO;

/**
 * @author 박초원
 * @since 2021. 5. 20.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                  수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 5. 20.      박초원      	       최초작성
 * 2021. 5. 27.		 최희수		fullCalendar를 사용하여 일정 조회
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */

@Controller
@RequestMapping("/main/community")
public class CollegeScheduleController {
	private static final Logger logger = LoggerFactory.getLogger(CollegeScheduleController.class);
	@Inject
	private CalendarService calendarService;
	
	@RequestMapping("/collegeSchedule.do")
	public String collegeSchedule() {
		logger.info("view?");
		return "main/community/collegeSchedule";
	}
	
	@RequestMapping(value="/scheduleprocess.do", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public List<EventWrapper> eventData() {
		logger.info("eventData()");
		List<ScheduleVO> list = calendarService.scheduleList();
		List<EventWrapper> wrapperList = new ArrayList<>();
		wrapperList = calendarService.calendarList();
		for(ScheduleVO tmp : list) {
			EventWrapper ew = new EventWrapper(tmp);
			wrapperList.add(ew);
		}
		return wrapperList;
	}
	
	@RequestMapping(value="/comList.do", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public List<ComCodeVO> comList() {
		ComCodeVO com = new ComCodeVO();
		List<ComCodeVO> comList = calendarService.comCodeList();
		com.setSubjectList(calendarService.subjectList());
		comList.add(com);
		return comList;
	}
	
	
	@RequestMapping(value="/insert.do", method=RequestMethod.POST)
	public String insert(
			@ModelAttribute("svo") ScheduleVO svo
		) {
		calendarService.scheduleInsert(svo);
		return "redirect:/main/community/collegeSchedule.do";
	}
	
}
