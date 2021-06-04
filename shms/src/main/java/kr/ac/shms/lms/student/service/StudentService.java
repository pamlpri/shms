package kr.ac.shms.lms.student.service;

import java.util.List;
import java.util.Map;

import kr.ac.shms.common.enumpkg.ServiceResult;
import kr.ac.shms.common.vo.RegInfoCngVO;
import kr.ac.shms.lms.student.vo.AttendVO;
import kr.ac.shms.lms.student.vo.ConsltReqVO;
import kr.ac.shms.lms.student.vo.ConsultingVO;
import kr.ac.shms.lms.student.vo.MypageVO;
import kr.ac.shms.lms.student.vo.StudentVO;
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
 * 2021. 5. 22.   박초원        최초작성
 * 2021. 5. 31.   김보미		출석(입실)
 * 2021. 5. 31.   송수미	    학생 통합정보시스템 메인 페이지 구현
 * 2021. 6.  1.   김보미		출석(퇴실)
 * 2021. 6.  2.   최희수        웹메일 등록 구현
 * 2021. 6.  3.   김보미 		학생 정보 출력(증명서 신청), 증명서, 신청사유 정보출력
 * 
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
import kr.ac.shms.subject.vo.SubjectVO;
public interface StudentService {

	/**
	 * 한 학생에 대한 정보 추출
	 * @param id
	 * @return 데이터가 없으면 null 반환
	 */
	public StudentVO student(String id);
	
	/**
	 * 입실시간 추출
	 * @param attendVO 학번, 강의 코드
	 * @return 입실시간
	 */
	public String selectAttendTime(AttendVO attendVO);
	/**
	 * qr코드에 넣을 정보 추출
	 * @param attendInfo 학번, 강의코드
	 * @return 학번, 강의코드
	 */
	
	public AttendVO selectQRInfo(AttendVO attendInfo);
	/**
	 * 출석(입실)정보를 insert
	 * @param attendInfo 학번, 강의코드
	 * @return ServiceResult 
	 */
	public ServiceResult attend(AttendVO attendInfo);
	
	/**
	 * 출석(퇴실)정보를 update
	 * @param exitInfo 학번, 강의코드
	 * @return ServiceResult
	 */
	public ServiceResult exit(AttendVO exitInfo);
	
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
	public List<ConsultingVO> consltReqList(String stdnt_no);

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
}
