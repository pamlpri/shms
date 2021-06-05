package kr.ac.shms.common.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import kr.ac.shms.common.vo.SubjectVO;

/**
 * @author 박초원
 * @since 2021. 6. 5.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                  수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 6. 5.      박초원      	       최초작성
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Repository
public interface OthersDAO {
	/**
	 * 대학조회
	 * @return 데이터가 없으면 null 반환
	 */
	public List<Map<String, Object>> selectCollegeList();
	
	/**
	 * 학과조회
	 * @param col_code
	 * @return 데이터가 없으면 null 반환
	 */
	public List<SubjectVO> selectSubjectList(String col_code);
}
