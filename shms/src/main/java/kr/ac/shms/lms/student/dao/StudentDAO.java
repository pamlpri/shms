package kr.ac.shms.lms.student.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import kr.ac.shms.common.vo.RegInfoCngVO;
import kr.ac.shms.lms.student.vo.AttendVO;
import kr.ac.shms.lms.student.vo.ConsltReqVO;
import kr.ac.shms.lms.student.vo.MypageVO;
import kr.ac.shms.lms.student.vo.StudentVO;
import kr.ac.shms.subject.vo.SubjectVO;

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
 * 2021. 5. 31.   송수미	     학생 통합정보시스템 메인 페이지 구현
 * 2021. 6. 01.   김보미		출석(퇴실)
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Repository
public interface StudentDAO {
	
	public String selectAttendTime(AttendVO attendVO);
	
	/**
	 * 데이터 계산을 위해 정보 추출
	 * @param studentInfo 학번, 강의코드
	 * @return attendVO
	 */
	public AttendVO selectAttendInfo(AttendVO studentInfo);
	/**
	 * 한 학생에 대한 정보 추출
	 * @param id
	 * @return 데이터가 없으면 null 반환
	 */
	public StudentVO student(String id);
	
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
	public int attend(AttendVO attendInfo);
	
	/**
	 * 출석(퇴실)정보를 update
	 * @param exitInfo 학번, 강의코드
	 * @return ServiceResult
	 */
	public int exit(AttendVO exitInfo);
	
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
	public List<ConsltReqVO> consltReqList(String stdnt_no);
	
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
}






