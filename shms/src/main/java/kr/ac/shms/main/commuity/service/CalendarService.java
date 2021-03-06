package kr.ac.shms.main.commuity.service;

import java.util.List;

import kr.ac.shms.common.vo.SubjectVO;
import kr.ac.shms.main.commuity.vo.ComCodeVO;
import kr.ac.shms.main.commuity.vo.EventWrapper;
import kr.ac.shms.main.commuity.vo.ScheduleVO;

public interface CalendarService {
	/**
	 * 전체 일정 리스트 호출
	 * @return 값이 없으면 null 반환
	 */
	public List<ScheduleVO> scheduleList();
	/**
	 * 공통 코드 리스트 호출
	 * @return 값이 없으면 null 반환
	 */
	public List<ComCodeVO> comCodeList();
	/**
	 * 학과 리스트 호출
	 * @return 값이 없으면 null 반환
	 */
	public List<SubjectVO> subjectList();
	/**
	 * 공휴일 리스트 호출
	 * @return
	 */
	public List<EventWrapper> calendarList();
	/**
	 * 일정 등록
	 * @param svo
	 * @return
	 */
	public int scheduleInsert(ScheduleVO svo);
}
