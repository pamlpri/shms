package kr.ac.shms.lms.student.service;

import java.util.List;
import java.util.Map;

import kr.ac.shms.common.enumpkg.ServiceResult;
import kr.ac.shms.common.vo.RegInfoCngVO;
import kr.ac.shms.common.vo.SubjectVO;
import kr.ac.shms.lms.login.vo.UserLoginVO;
import kr.ac.shms.lms.student.vo.AttendVO;
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
 * @author 작성자명
 * @since 2021. 6. 4.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 6. 4.   	작성자명     	최초작성
 * 2021. 6. 4.		최희수		시간표 출력
 * 2021. 6.  5.   	박초원	   	개설과목조회 
 * 2021. 6.  5.   	송수미 	   	수강신청 인덱스 페이지에 필요한 정보 조회
 * 2021. 6.  7.   박초원       장바구니 조회, 등록, 삭제
 * 2021. 6.  8.   박초원       수강신청 추가
 * 2021. 6.  9.   최희수	  학과 학생들 출력
 * 2021. 6. 10.	  김보미		입실, 퇴실 카운트
 * 2021. 6. 17.   최희수       이력서/자기소개서 첨삭
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */	
public interface StudentService {
	public void selectMainSuganList(Map<String,Object> paramMap);
	
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
	 * @return ServiceResult
	 */
	public ServiceResult webMailUpdate(String stdnt_no);
	
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
	 * 마이페이지 정보 수정
	 * @param studentVO
	 * @return cnt > 0 성공
	 */
	public ServiceResult mypageUpdate(StudentVO studentVO);
	
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
	 * 지도교수상담내역
	 * @param stdnt_no
	 * @return 데이터가 없으면 null
	 */
	public List<ConsultingVO> advisorConsltReqList(String stdnt_no);

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
	public ServiceResult consultingDelete(String req_no);
	
	/**
	 * 지도교수 상담 신청
	 * @param consultingVO
	 * @return ServiceResult
	 */
	public ServiceResult consultingInsert(ConsultingVO consultingVO);
	
	/**
	 * 지도교수 상담 수정
	 * @param consultingVO
	 * @return ServiceResult
	 */
	public ServiceResult consultingUpdate(ConsultingVO consultingVO);
		
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
    public ServiceResult insertCart(SugangVO sugang);
    
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
    public ServiceResult deleteCart(SugangVO sugang);
    
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
    public ServiceResult insertRegistration(SugangVO sugang);
    
    /**
     * 해당 학과에 포함된 학생들만 추출
     * @param sub_code
     * @return 데이터가 없으면 null
     */
    public List<MypageVO> studentSubList(String sub_code);

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
     * @return ServiceResult
     */
    public ServiceResult insertEditReq(EditReqVO editReq);
    
    /**
     * 이력서/자소서 상세 조회
     * @param bo_no
     * @return
     */
    public EditReqVO selectEditReq(int edit_req_no);
    
    /**
     * 이력서/자소서 삭제
     * @param editReq
     * @return ServiceResult
     */
    public ServiceResult deleteEditReq(EditReqVO editReq);
    
    /**
     * 이력서/자소서 수정
     * @param editReq
     * @return ServiceResult
     */
    public ServiceResult updateEditReq(EditReqVO editReq);
}