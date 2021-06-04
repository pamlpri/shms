package kr.ac.shms.lms.staff.dao;

import org.springframework.stereotype.Repository;

import kr.ac.shms.common.vo.StaffVO;
import kr.ac.shms.lms.staff.vo.PMyPageVO;
import kr.ac.shms.lms.student.vo.StudentVO;
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
 * 2021. 5. 31.   송수미        교수 상담건수 조회
 * 2021. 6. 4.    최희수	  교수 마이페이지 조회, 수정
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
import kr.ac.shms.subject.vo.SubjectVO;
@Repository
public interface LmsStaffDAO {
	/**
	 * 해당 학적과 직원 정보 추출
	 * @param id
	 * @return 데이터가 없을 경우 null로 반환
	 */
	public StaffVO staff(String id);
	/**
	 * 해당 교수에게 신청된 대기 상담 건수 조회
	 * @param id 교수 번호
	 * @return 대기 중인 상담 신청 건수 
	 */
	public int selectConsltCnt(String id);
	
	/**
	 * 학과명 호출
	 * @param staff_no
	 * @return 데이터가 없을 경우 null로 반환
	 */
	public SubjectVO subject(String staff_no);
	
	/**
	 * 교수 마이페이지 출력
	 * @param staff_no
	 * @return 데이터가 없으면 null로 반환
	 */
	public PMyPageVO pmyPage(String staff_no);
	
	/**
	 * 마이페이지에서 웹메일 신청(등록)
	 * @param staff_no
	 * @return cnt > 0 성공
	 */
	public int webMailUpdate(String staff_no);
	
	/**
	 * 마이페이지 정보 수정
	 * @param StaffVO
	 * @return cnt > 0 성공
	 */
	public int mypageUpdate(StaffVO staffVO);
}
