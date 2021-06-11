package kr.ac.shms.common.service;

import java.util.List;
import java.util.Map;

import kr.ac.shms.common.vo.LecScoreVO;
import kr.ac.shms.common.vo.RegInfoCngVO;

/**
 * @author 송수미
 * @since 2021. 6. 1.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 6. 1.      송수미       최초작성
 * 2021. 6. 11.		최희수	학과별 성적조회
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
public interface CommonService {
	/**
	 * 현재 처리가 필요한 다양한 요청들에 대한 건수 조회
	 * @param search
	 * @return 데이터가 없으면 0 반환
	 */
	public int selectCnt(Map<String, String> search);
	
	/**
	 * 처리 상태 상관없이 최근 5건의 학적 변동 신청내역을 조회
	 * @return 데이터가 없으면 null 반환
	 */
	public List<RegInfoCngVO> SelectRegInfoCngList();
	
	/**
	 * 학과 별 성적 조회
	 * @param lec_code
	 * @return 데이터가 없으면 null 반환
	 */
	public List<LecScoreVO> lecScoreList(String lec_code);
}
