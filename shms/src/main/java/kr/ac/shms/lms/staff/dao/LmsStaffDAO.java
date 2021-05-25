package kr.ac.shms.lms.staff.dao;

import org.springframework.stereotype.Repository;

import kr.ac.shms.common.vo.StaffVO;

@Repository
public interface LmsStaffDAO {
	/**
	 * 해당 학적과 직원 정보 추출
	 * @param id
	 * @return 데이터가 없을 경우 null로 반환
	 */
	public StaffVO staff(String id);
}
