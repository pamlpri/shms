package kr.ac.shms.main.commuity.service.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.ac.shms.main.commuity.dao.CalendarDAO;
import kr.ac.shms.main.commuity.service.CalendarService;
import kr.ac.shms.main.commuity.vo.ComCodeVO;
import kr.ac.shms.main.commuity.vo.EventWrapper;
import kr.ac.shms.main.commuity.vo.ScheduleVO;
import kr.ac.shms.main.commuity.vo.SubjectVO;

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
