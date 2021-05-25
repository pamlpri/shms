package kr.ac.shms.lecture.service;

import kr.ac.shms.common.vo.StaffVO;

public interface LectureProfessorService {
	/**
	 * 교수에 대한 정보 추출
	 * @param id
	 * @return 데이터가 없으면 null 반환
	 */
	public StaffVO staff(String id);
}
