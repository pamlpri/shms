package kr.ac.shms.lms.common.service;

import java.util.List;
import java.util.Map;

import kr.ac.shms.common.enumpkg.ServiceResult;
import kr.ac.shms.common.vo.CurriculumVO;
import kr.ac.shms.common.vo.LecScoreVO;
import kr.ac.shms.common.vo.LecrumVO;
import kr.ac.shms.common.vo.PagingVO;
import kr.ac.shms.common.vo.StaffVO;
import kr.ac.shms.lms.common.vo.ConsltDiaryVO;
import kr.ac.shms.lms.common.vo.CourseEducVO;
import kr.ac.shms.lms.common.vo.DietVO;
import kr.ac.shms.lms.common.vo.EntschtestDcVO;
import kr.ac.shms.lms.common.vo.FacilityRsvVO;
import kr.ac.shms.lms.common.vo.LecEvlResVO;
import kr.ac.shms.lms.common.vo.UserVO;
import kr.ac.shms.lms.common.vo.UsersVO;
import kr.ac.shms.lms.common.vo.WebmailVO;
import kr.ac.shms.lms.student.vo.ConsultingVO;
import kr.ac.shms.lms.student.vo.LectureVO;
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
 * 2021. 06. 04    	  박초원 	수신자, 첨부파일 추가
 * 2021. 06. 08		 최희수	상담 내역 상세 조회
 * 2021. 06. 10		  박초원    비밀번호 변경
 * 2021. 06. 14		최희수	강의평가 조회
 * 2021. 06. 16		최희수	취업지원 진로교육 조회
 * 2021. 06. 16.    최희수	취업상담 리스트 조회
 * 2021. 06. 23.    송수미	커리큘럼 생성
 * 2021. 06. 24.    송수미	커리큘럼 목록 조회
 * 2021. 06. 25.    송수미	강의 등록 및 조회
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
	 * @return rowCnt > 0 성공
	 */
	public ServiceResult insertWebmail(WebmailVO webmailVO);
	
	/**
	 * 하나의 웹메일의 상세 정보를 조회
	 * @param search selectMenu, send_no
	 * @return 웹메일의 상세 정보
	 */
	public WebmailVO selectWebmail(Map<String, Object> search);
	
	/**
	 * 웹메일 삭제하기
	 * @param search selectMenu, send_no
	 * @return rowCnt > 0 성공
	 */
	public ServiceResult deleteWebmail(Map<String, Object> search);
	
	/**
	 * 상담 일지에 쓰일 상담 내용 출력
	 * @param bo_no
	 * @return
	 */
	public ConsultingVO consulting(int bo_no);
	
	/**
	 * 상담 일지 저장
	 * @param consltDiaryVO
	 * @return ServiceResult
	 */
	public ServiceResult consultingDiaryInsert(ConsltDiaryVO consltDiaryVO);
	
	/**
	 * 상담 일지 상세보기 내용
	 * @param bo_no
	 * @return 데이터가 없으면 null
	 */
	public ConsltDiaryVO consltDiary(int bo_no);
	
	/**
	 * 상담이 완료 되면 상담상태 변경
	 * @param bo_no
	 * @return ServiceResult
	 */
	public ServiceResult consultingCompletion(int bo_no);
	
	/**
	 * 상담일지 수정
	 * @param consltDiaryVO
	 * @return ServiceResult
	 */
	public ServiceResult consultingDiaryUpdate(ConsltDiaryVO consltDiaryVO);
	
	/**
	 * 비밀번호 변경
	 * @param usersVO
	 */
	public ServiceResult updateNewPassword(UsersVO usersVO);
	
	/**
	 * 강의 평가 조회
	 * @param stdnt_no
	 * @return 데이터가 없으면 null
	 */
	public List<LecScoreVO> selectLecEvlList(String stdnt_no);
	
	/**
	 * 강의평가 유무
	 * @param stdnt_no
	 * @return 데이터가 없으면 null
	 */
	public List<LecScoreVO> selectEvlCheck(String stdnt_no);
	
	/**
	 * 강의평가 등록
	 * @param lecEvlResVO
	 * @return ServiceResult
	 */
	public ServiceResult insertEvl(LecEvlResVO lecEvlResVO);
	
	/**
	 * 진로교육 게시판 리스트 뽑기
	 * @return
	 */
	public List<CourseEducVO> selectAllCourseEducList();
	
	/**
	 * 진로교육 게시글 상세보기
	 * @param boNo
	 * @return
	 */
	public CourseEducVO selectCourseEduc(int boNo);
	
	/**
	 * 취업지원 상담신청 리스트
	 * @param stdnt_no
	 * @return
	 */
	public List<ConsltDiaryVO> selectConsltReqList(String stdnt_no);
	
	/**
	 * 강의평가 진행된 수강중인 강의 수
	 * @param stdnt_no
	 * @return
	 */
	public ServiceResult selectLectureEvaluationCheck(String stdnt_no);

	/**
	 * 검색 조건에 맞는 강의 조회
	 * @param curr 검색 조건
	 * @return 데이터가 없으면 null 반환
	 */
	public List<CurriculumVO> selectCurrInfo(CurriculumVO curr);
	
	/**
	 * 검색 조건에 맞는 교수 정보 조회
	 * @param user 검색 조건
	 * @return 데이터가 없으면 null 반환
	 */
	public List<UserVO> selectProfSearch(UserVO user);
	
	/**
	 * 올해 연도, 학기 정보, 강의 분류 정보 조회
	 * @return 데이터가 없으면 null 반환
	 */
	public List<CurriculumVO> selectCurIndexInfo();
	
	/**
	 * 커리큘럼 등록
	 * @param curriculum
	 * @return 성공, 실패
	 */
	public ServiceResult insertCurriculum(CurriculumVO curriculum);
	
	/**
	 * 검색결과에 따라 조회된 커리큘럼 수 
	 * @param pagingVO
	 * @return 데이터가 없으면 0 반환
	 */
	public int selectCurrCount(PagingVO<CurriculumVO> pagingVO);
	
	/** 
	 * 검색결과에 따라 조회된 커리큘럼 목록
	 * @param pagingVO
	 * @return 데이터가 없으면 null 반환
	 */
	public List<CurriculumVO> selectCurrList(PagingVO<CurriculumVO> pagingVO);
	
	/**
	 * 커리큘럼 코드에 따른 커리큘럼 정보 조회
	 * @param cur_code
	 * @return 데이터가 없으면 null 반환
	 */
	public CurriculumVO selectCurriculum(String cur_code);
	
	/**
	 * 교수 스케줄이 겹치지 않는지 확인
	 * @param searchMap
	 * @return 데이터가 없으면 0 반환
	 */
	public int selectStaffSchdulChk(Map<String, Object> searchMap);
	
	/**
	 * 조건에 따른 강의실 조회
	 * @param searchMap
	 * @return 데이터가 없으면 null 반환
	 */
	public List<LecrumVO> selectLecrumInfo(Map<String, Object> searchMap);
	
	/**
	 * 강의 등록
	 * @param lecture
	 * @return 성공, 실패
	 */
	public ServiceResult insertLecture(LectureVO lecture);

	/**
	 * cur_code를 가진 가장 최근에 개설된 강의 정보 조회
	 * @param cur_code
	 * @return 데이터가 없으면 null 반환
	 */
	public LectureVO selectLecture(String cur_code);
	
	/**
	 * 커리큘럼삭제
	 * @param cur_code
	 * @return 성공, 실패
	 */
	public ServiceResult deleteCurriculum(String cur_code);
	
	/**
	 * 커리큘럼에 따른 현재 학기에 등록된 강의 수 
	 * @param cur_code
	 * @return 등록된 강의 수
	 */
	public int selectRegisteredLecCnt(String cur_code);

}
