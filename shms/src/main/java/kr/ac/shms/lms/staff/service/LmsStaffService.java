package kr.ac.shms.lms.staff.service;

import kr.ac.shms.common.vo.StaffVO;

public interface LmsStaffService {
	/**
	 * 해당 학적과 직원 정보 추출
	 * @param id
	 * @return 데이터가 없을 경우 null로 반환
	 */
	public StaffVO staff(String id);
}
