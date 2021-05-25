package kr.ac.shms.lecture.dao;

import org.springframework.stereotype.Repository;

import kr.ac.shms.common.vo.StaffVO;

@Repository
public interface LectureProfessorDAO {
	/**
	 * 교수에 대한 정보 추출
	 * @param id
	 * @return 데이터가 없으면 null 반환
	 */
	public StaffVO staff(String id);
}
