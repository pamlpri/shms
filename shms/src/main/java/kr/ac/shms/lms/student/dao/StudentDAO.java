package kr.ac.shms.lms.student.dao;

import org.springframework.stereotype.Repository;

import kr.ac.shms.lms.student.vo.StudentVO;

@Repository
public interface StudentDAO {
	/**
	 * 한 학생에 대한 정보 추출
	 * @param id
	 * @return 데이터가 없으면 null 반환
	 */
	public StudentVO student(String id);
}
