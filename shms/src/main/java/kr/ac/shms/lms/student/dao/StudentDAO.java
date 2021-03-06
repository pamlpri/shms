package kr.ac.shms.lms.student.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import kr.ac.shms.common.enumpkg.ServiceResult;
import kr.ac.shms.common.vo.RegInfoCngVO;
import kr.ac.shms.common.vo.StaffVO;
import kr.ac.shms.common.vo.SubjectVO;
import kr.ac.shms.lms.common.vo.FacilityRsvVO;
import kr.ac.shms.lms.login.vo.UserLoginVO;
import kr.ac.shms.lms.student.vo.AttendVO;
import kr.ac.shms.lms.student.vo.BookVO;
import kr.ac.shms.lms.student.vo.ConsultingVO;
import kr.ac.shms.lms.student.vo.EditReqVO;
import kr.ac.shms.lms.student.vo.LectureVO;
import kr.ac.shms.lms.student.vo.MypageVO;
import kr.ac.shms.lms.student.vo.StudentVO;
import kr.ac.shms.lms.student.vo.SugangLecSTVO;
import kr.ac.shms.lms.student.vo.SugangVO;
import kr.ac.shms.lms.student.vo.TimeTableVO;
import kr.ac.shms.main.commuity.vo.ComCodeVO;

/**
 * @author 박초원
 * @since 2021. 5. 22.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일          수정자         수정내용
 * --------     --------    ----------------------
 * 2021. 5. 22.   박초원       	최초작성
 * 2021. 5. 31.   김보미		출석(입실)
 * 2021. 5. 31.   송수미	   	학생 통합정보시스템 메인 페이지 구현
 * 2021. 6.  1.   김보미		출석(퇴실)
 * 2021. 6.  3.   김보미        학생 정보 출력(증명서 신청), 증명서, 신청사유 정보출력
 * 2021. 6.  4.   최희수	   	내 시간표 출력	
 * 2021. 6.  5.   박초원	   	개설과목조회 
 * 2021. 6.  5.   송수미 	   	수강신청 인덱스 페이지에 필요한 정보 조회
 * 2021. 6.  7.   박초원       장바구니 조회, 등록, 삭제
 * 2021. 6.  8.   박초원       수강신청 추가
 * 2021. 6.  9.   최희수	  학과 학생들 출력
 * 2021. 6. 17.   최희수       이력서/자기소개서 첨삭
 * 2021. 6. 20.	  김보미 		자퇴신청등록
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Repository
public interface StudentDAO {

	/**
	 * 한 학생에 대한 정보 추출
	 * @param id
	 * @return 데이터가 없으면 null 반환
	 */
	public StudentVO student(String id);
	
	/**
	 * 학생의 도서 대출에 대한 정보 추출
	 * @param search 대출/연체, 학생 id
	 * @return 대출 도서 수, 연체 도서 수
	 */
	public Map<String, String> bookLoanCnt(String stdnt_no);
	
	/**
	 * 마이페이지에서 웹메일 신청(등록)
	 * @param stdnt_no
	 * @return cnt > 0 성공
	 */
	public int webMailUpdate(String stdnt_no);
	
	/**
	 * 마이페이지 학과명 추출
	 * @param sub_code
	 * @return 데이터가 없으면 null
	 */
	public SubjectVO subject(String sub_code);
	
	/**
	 * 마이페이지 정보 추출
	 * @param stdnt_no
	 * @return 데이터가 없으면 null
	 */
	public MypageVO regInfo(String stdnt_no);
	
	/**
	 * 지도교수상담내역
	 * @param stdnt_no
	 * @return 데이터가 없으면 null
	 */
	public List<ConsultingVO> advisorConsltReqList(String stdnt_no);
	
	/**
	 * 마이페이지 정보 수정
	 * @param studentVO
	 * @return cnt > 0 성공
	 */
	public int mypageUpdate(StudentVO studentVO);
	
	/**
	 * 해당 학생의 학적 변동사항 전체 출력 
	 * @param stdnt_no
	 * @return 데이터가 없으면 null
	 */
	public List<RegInfoCngVO> ReginfoList(String stdnt_no);
	
	/**
	 * 해당 학생의 등록금 수
	 * @param stdnt_no
	 * @return 
	 */
	public int payCount(String stdnt_no);
	
	/**
	 * 증명서 신청 페이지에 학생 정보 출력
	 * @param stdnt_no 학번
	 * @return
	 */
	public StudentVO selectStdntInfoForCetf(String stdnt_no);
	
	/**
	 * 증명서 종류 출력
	 * @return 증명서 종류 
	 */
	public List<ComCodeVO> selectCetfList();
	
	/**
	 * 증명서 신청 사유 출력
	 * @return 신청 사유
	 */
	public List<ComCodeVO> selectCetfResnList();
	
	/**
	 * 마이페이지 학적 추출
	 * @param stdnt_no
	 * @return
	 */
	public String reginfo(String stdnt_no);
	
	/**
	 * 지도교수상담 상담상태가 대기일 때 삭제
	 * @param curCode
	 * @return
	 */
	public int consultingDelete(String req_no);
	
	/**
	 * 지도교수 상담 신청
	 * @param consultingVO
	 * @return ServiceResult
	 */
	public int consultingInsert(ConsultingVO consultingVO);
	
	/**
	 * 지도교수 상담 수정
	 * @param consultingVO
	 * @return ServiceResult
	 */
	public int consultingUpdate(ConsultingVO consultingVO);
		
	/**
	 * 로그인 한 학생이 듣는 수강 목록 출력
	 * @param stdnt_no
	 * @return 데이터가 없으면 null 반환
	 */
	public List<SugangLecSTVO> sugangList(String stdnt_no);
	
	/**
	 * 수강중인 강의에 대한 정보 출력
	 * @param lec_code
	 * @return 데이터가 없으면 null 반환
	 */
	public LectureVO lecture(String lec_code);
	
	/**
	 * 해당 학생이 가지고 있는 시간표 출력
	 * @param stdnt_no
	 * @return
	 */
	public List<TimeTableVO> timeTable(String stdnt_no);
	
	/**
	 * 개설과목 조회
	 * @param sugangVO
	 * @return 데이터가 없으면 null 반환
	 */
	public List<SugangVO> selectSugangList(SugangVO sugang);
	
    /**
     * 수강 신청 인덱스 페이지의 정보 조회
     * @param stdnt_no 학번
     * @return 신청교과목 수, 신청 학점, 수강 가능 학점
     */
    public SugangVO selectSugangReqInfo(SugangVO sugang);
    
    /**
     * 장바구니 과목 조회
     * @param sugangVO
     * @return 데이터가 없으면 null 반환
     */
    public List<SugangVO> selectCartList(String stdnt_no);
    
    /**
     * 장바구니 과목 담기
     * @param sugangVO
     * @return
     */
    public int insertCart(SugangVO sugang);
    
    /**
     * 장바구니 중복 조회
     * @param sugangVO
     * @return
     */
    public SugangVO selectSugangAuth(SugangVO sugang);
    
    /**
     * 한 과목만 조회
     * @param lec_code
     * @return 데이터가 없으면 null 반환
     */
    public SugangVO selectSugangInfo(String lec_code);
    
    /**
     * 장바구니 과목 삭제
     * @param sugangVO
     * @return 
     */
    public int deleteCart(SugangVO sugang);
    
    /**
     * 수강신청 항목 조회
     * @param sugangVO
     * @return 데이터가 없으면 null 반환
     */
    public List<SugangVO> selectRegistrationList(String stdnt_no);
    
    /**
     * 수강신청 등록
     * @param sugangVO
     * @return 
     */
    public int insertRegistration(SugangVO sugang);
    
    /**
     * 장바구니 인원이 제한인원보다 미달이거나 같을때 자동 업데이트
     * @param map
     */
    public void updateSugang(Map<String, Object> pMap);
    
    /**
     * 해당 학과에 포함된 학생들만 추출
     * @param sub_code
     * @return 데이터가 없으면 null
     */
    public List<MypageVO> studentSubList(StaffVO staffVO);

    
    public List<StudentVO> passwordUpdate();
    
    public int passUpdate(UserLoginVO userLogin);
    
    /**
     * 이력서/자소서 첨삭 리스트 출력
     * @param stdnt_no
     * @return
     */
    public List<EditReqVO> selectEditReqList(String stdnt_no);
    
    /**
     * 이력서/자소서 등록
     * @param editReq
     * @return cnt > 0 성공
     */
    public int insertEditReq(EditReqVO editReq);
    
    /**
     * 이력서/자소서 상세 조회
     * @param bo_no
     * @return
     */
    public EditReqVO selectEditReq(int edit_req_no);
    
    /**
     * 이력서/자소서 삭제
     * @param editReq
     * @return cnt > 0 성공
     */
    public int deleteEditReq(EditReqVO editReq);
    
    /**
     * 이력서/자소서 수정
     * @param editReq
     * @return cnt > 0 성공
     */
    public int updateEditReq(EditReqVO editReq);
    
    /**
     * 도서 목록 전체 조회
     * @return
     */
    public List<BookVO> selectBookList();
    
    /**
     * 대출 도서 목록 조회
     * @param stdnt_no
     * @return
     */
    public List<BookVO> selectBookLoanList(String stdnt_no);
    
    /**
     * 열람실 목록 조회
     * @return
     */
    public List<FacilityRsvVO> selectFacilityList();
    
    /**
     * 도서관 열람실 예약 내역 조회
     * @param stdnt_no
     * @return
     */
    public List<FacilityRsvVO> selectFacilityRsvList(String stdnt_no);
    
    /**
     * 열람실 예약
     * @param facilityRsv
     * @return cnt > 0 성공
     */
    public int insertFacilityRsv(FacilityRsvVO facilityRsv);
    
    /**
     * 자퇴 신청 등록
     * @param reginfoCng
     * @return 
     */
    public int insertDrop(RegInfoCngVO reginfoCng); 
    
    /**
     * 학생의 자퇴신청 내역 조회
     * @param stdnt_no
     * @return
     */
    public List<RegInfoCngVO> selectRegInfoCngStudentList(String stdnt_no);
    
    /**
     * 해당 자퇴신청 내역 조회
     * @param cng
     * @return
     */
    public RegInfoCngVO selectReginfoCng(RegInfoCngVO cng); 
    
    /**
     * 도서관 예약 가능 유무
     * @param stdnt_no
     * @return
     */
    public FacilityRsvVO selectFacilityRsv(String stdnt_no);
    
    /**
     * 열람식 예약 한 뒤 상태 변화
     * @param facility_no
     * @return cnt > 0 성공
     */
    public int updateFacility(int facility_no);
    
    /**
     * 열람실 입실 QR
     * @param facilityRsvVO
     * @return
     */
    public int updateBgdt(String stdnt_no);
    
    /**
     * 열람실 퇴실 QR
     * @param facilityRsvVO
     * @return
     */
    public int updateEnddt(String stdnt_no);
    
    /**
     * 도서관 열람실 매일 자정에 예약 초기화
     * @param map
     */
    public void updateRsvPosblAt(Map<String, Object> pMap);
    
}