package kr.ac.shms.lms.staff.service;

import kr.ac.shms.common.vo.StaffVO;

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
}
