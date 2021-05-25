package kr.ac.shms.lms.student.service;

import kr.ac.shms.lms.student.vo.StudentVO;

public interface StudentService {
	/**
	 * 한 학생에 대한 정보 추출
	 * @param id
	 * @return 데이터가 없으면 null 반환
	 */
	public StudentVO student(String id);
}
