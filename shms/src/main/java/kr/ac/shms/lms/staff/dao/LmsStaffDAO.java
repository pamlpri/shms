package kr.ac.shms.lms.staff.dao;

import org.springframework.stereotype.Repository;

import kr.ac.shms.common.vo.StaffVO;
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
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Repository
public interface LmsStaffDAO {
	/**
	 * 해당 학적과 직원 정보 추출
	 * @param id
	 * @return 데이터가 없을 경우 null로 반환
	 */
	public StaffVO staff(String id);
}
