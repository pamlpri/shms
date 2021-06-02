package kr.ac.shms.lms.common.service;

import java.util.List;
import java.util.Map;

import kr.ac.shms.lms.common.vo.CourseEducVO;
import kr.ac.shms.lms.common.vo.DietVO;
import kr.ac.shms.main.commuity.vo.ScheduleVO;

/**
 * @author 송수미
 * @since 2021. 5. 31.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 5. 31.      송수미       최초작성
 * 2021. 06. 02.      송수미       진로교육 목록 조회 추가
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
public interface LmsCommonService {
	
	/**
	 * 오늘의 식단을 조회
	 * @return 오늘 식단 정보
	 */
	public DietVO selectDiet();
	
	/**
	 * 오늘 받은 메일, 안 읽은 전체 메일의 수를 조회
	 * @return 오늘 받은 메일, 안 읽은 전체 메일의 수
	 */
	public Map<String, String> selectWebmailCnt(String id);
	
	/**
	 * 오늘 학사일정을 조회
	 * @return 데이터가 없으면 null
	 */
	public List<ScheduleVO> selectTodaySchdul();
	
	/**
	 * 현재 예약되어 있는 최근 5개의 진로교육 목록을 조회
	 * @return 데이터가 없으면 null
	 */
	public List<CourseEducVO> selectCourseEducList();
	
}
