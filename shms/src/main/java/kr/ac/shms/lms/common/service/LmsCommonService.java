package kr.ac.shms.lms.common.service;

import java.util.List;
import java.util.Map;

import kr.ac.shms.common.enumpkg.ServiceResult;
import kr.ac.shms.common.vo.StaffVO;
import kr.ac.shms.lms.common.vo.CourseEducVO;
import kr.ac.shms.lms.common.vo.DietVO;
import kr.ac.shms.lms.common.vo.EntschtestDcVO;
import kr.ac.shms.lms.common.vo.FacilityRsvVO;
import kr.ac.shms.lms.common.vo.UserVO;
import kr.ac.shms.lms.common.vo.WebmailVO;
import kr.ac.shms.main.commuity.vo.PagingVO;
import kr.ac.shms.main.commuity.vo.ScheduleVO;

/**
 * @author 송수미
 * @since 2021. 5. 31.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일         수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 5. 31.      송수미       최초작성
 * 2021. 06. 02.      송수미       진로교육 목록 조회 추가
 * 2021. 06. 02 	  박초원	웹메일 주소록 검색 추가
 * 2021. 06. 03       박초원 	웹메일 보내기 추가
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
	
	/**
	 * lms에서 관리하는 게시글 수 조회
	 * @return 데이터가 없으면 0
	 */
	public int selectLmsBoardCnt(Map<String, String> search);
	
	/**
	 * 현재 예약되어 있는 입시설명회 목록 조회
	 * @return 데이터가 없으면 0
	 */
	public List<EntschtestDcVO> selectEntDcList();
	
	/**
	 * 해당 학과에 소속되어 있는 교수 목록 조회
	 * @return 데이터가 없으면 null
	 */
	public List<StaffVO> selectProfInfo(String sub_code);
	
	/**
	 * 현재 예약되어 있는 편의시설 예약정보 목록을 조회
	 * @return 데이터가 없으면 null
	 */
	public List<FacilityRsvVO> selectFacilityRsvList();
	
	/**
	 * 고사 일정에 대한 목록을 조회
	 * @return 데이터가 없으면 null
	 */
	public List<ScheduleVO> selectTestSchdulList();
	
	/**
	 * 학과에 따른 성비
	 * @param sub_code TODO
	 * @return 데이터가 없으면 null
	 */
	public List<Map<String, Object>> selectGenCnt(String sub_code);

	/**
	 * 개인이 보낸/받은 웹메일 조회
	 * @param search 페이지 정보, 검색 키워드, 계정 정보
	 * @return 데이터가 없으면 null
	 */
	public int selectWebmailtotalCnt(PagingVO<WebmailVO> search);
	
	/**
	 * 개인이 보낸/받은 웹메일 조회
	 * @param search 페이지 정보, 검색 키워드, 계정 정보
	 * @return 데이터가 없으면 null
	 */
	public List<WebmailVO> selectWebmailList(PagingVO<WebmailVO> search);
	
	/**
	 * 웹메일 주소록 검색
	 * @param user 정보
	 * @return 데이터가 없으면 null
	 */
	public List<UserVO> selectAddressBook(UserVO userVO);
	
	/**
	 * 웹메일 보내기
	 * @param webmailVO
	 * @return 데이터가 없으면 null
	 */
	public ServiceResult insertWebmail(WebmailVO webmailVO);
}
