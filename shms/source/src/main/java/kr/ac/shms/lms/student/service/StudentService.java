package kr.ac.shms.lms.student.service;

import java.util.Map;

import kr.ac.shms.common.enumpkg.ServiceResult;
import kr.ac.shms.lms.student.vo.AttendVO;
import kr.ac.shms.lms.student.vo.StudentVO;
import kr.ac.shms.lms.student.vo.SugangLecSTVO;
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
public interface StudentService {

	/**
	 * 한 학생에 대한 정보 추출
	 * @param id
	 * @return 데이터가 없으면 null 반환
	 */
	public StudentVO student(String id);
	
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
}
