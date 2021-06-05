package kr.ac.shms.lms.staff.service;

import kr.ac.shms.common.enumpkg.ServiceResult;
import kr.ac.shms.common.vo.StaffVO;
import kr.ac.shms.common.vo.SubjectVO;
import kr.ac.shms.lms.staff.vo.PMyPageVO;

public interface LmsStaffService {
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
	 * 학과명과 학과장 여부 호출
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
	 * @return ServiceResult
	 */
	public ServiceResult webMailUpdate(String staff_no);
	
	/**
	 * 마이페이지 정보 수정
	 * @param staffVO
	 * @return cnt > 0 성공
	 */
	public ServiceResult mypageUpdate(StaffVO staffVO);
}
