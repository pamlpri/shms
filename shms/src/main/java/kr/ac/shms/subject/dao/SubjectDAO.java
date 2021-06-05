package kr.ac.shms.subject.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import kr.ac.shms.common.vo.StaffVO;
import kr.ac.shms.common.vo.SubjectVO;

/**
 * @author 송수미
 * @since 2021. 5. 27.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 5. 27.      송수미       최초작성
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Repository
public interface SubjectDAO {
	/**
	 * 하나의 학과 정보를 조회
	 * @param sub_code 학과 코드
	 * @return 학과 정보, 해당 학과가 없으면 null
	 */
	public SubjectVO selectSub(String sub_code);
	/**
	 * 해당 학과에 속한 교수 목록 조회
	 * @param sub_code 학과 코드
	 * @return 교수 리스트, 없으면 null
	 */
	public List<StaffVO> selectProf(String sub_code);
	
}
