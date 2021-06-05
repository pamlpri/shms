package kr.ac.shms.main.commuity.service.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.ac.shms.common.vo.SubjectVO;
import kr.ac.shms.main.commuity.dao.CalendarDAO;
import kr.ac.shms.main.commuity.service.CalendarService;
import kr.ac.shms.main.commuity.vo.ComCodeVO;
import kr.ac.shms.main.commuity.vo.EventWrapper;
import kr.ac.shms.main.commuity.vo.ScheduleVO;

/**
 * @author 최희수
 * @since 2021. 5. 27.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 5. 27.      최희수       최초작성
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Service
public class CalendarServiceImpl implements CalendarService{
	@Inject
	private CalendarDAO calendarDao;
	@Override
	public List<ScheduleVO> scheduleList() {
		return calendarDao.scheduleList();
	}

	@Override
	public List<ComCodeVO> comCodeList() {
		return calendarDao.comCodeList();
	}

	@Override
	public List<SubjectVO> subjectList() {
		return calendarDao.subjectList();
	}

	@Override
	public List<EventWrapper> calendarList() {
		return calendarDao.calendarList();
	}

	@Override
	public int scheduleInsert(ScheduleVO svo) {
		return calendarDao.scheduleInsert(svo);
	}

}
