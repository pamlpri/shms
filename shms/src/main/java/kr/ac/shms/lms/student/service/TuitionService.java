package kr.ac.shms.lms.student.service;

import java.util.List;

import kr.ac.shms.lms.student.vo.TuitionVO;

/**
 * @author 김보미
 * @since 2021. 6. 12.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일         수정자        수정내용
 * --------     --------    ----------------------
 * 2021. 6. 12.   김보미        최초작성
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */

public interface TuitionService {
	
	/**
	 * 학생이 지불한 등록금 내역 조회
	 * @param stdnt_no
	 * @return 
	 */
	public List<TuitionVO> selectTuitionList(String stdnt_no);
	
	/**
	 * 등록금 고지서 조회
	 * @param stdnt_no
	 * @return
	 */
	public TuitionVO selectTuitionBill(String stdnt_no);
}