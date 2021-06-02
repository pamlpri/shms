package kr.ac.shms.main.commuity.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import kr.ac.shms.main.commuity.vo.ComCodeVO;
import kr.ac.shms.main.commuity.vo.EventWrapper;
import kr.ac.shms.main.commuity.vo.ScheduleVO;
import kr.ac.shms.subject.vo.SubjectVO;

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
@Repository
public interface CalendarDAO {
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
