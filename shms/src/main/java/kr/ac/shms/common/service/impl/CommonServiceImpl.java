package kr.ac.shms.common.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import kr.ac.shms.common.dao.CommonDAO;
import kr.ac.shms.common.service.CommonService;
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
@Service
public class CommonServiceImpl implements CommonService {
	private static final Logger logger = LoggerFactory.getLogger(CommonServiceImpl.class);
	@Inject
	private CommonDAO commonDAO;
	
	@Override
	public int selectCnt(Map<String, String> search) {
		return commonDAO.selectCnt(search);
	}

	@Override
	public List<RegInfoCngVO> SelectRegInfoCngList() {
		return commonDAO.selectRegInfoCngList();
	}

	@Override
	public List<LecScoreVO> lecScoreList(LecScoreVO lecScoreVO) {
		return commonDAO.selectLecScoreList(lecScoreVO);
	}

	@Override
	public List<LecScoreVO> lecYear(String stdnt_no) {
		return commonDAO.selectLecYear(stdnt_no);
	}

	@Override
	public List<LecScoreVO> selectSemstrList(LecScoreVO lecScoreVO) {
		return commonDAO.selectSemstrList(lecScoreVO);
	}

	@Override
	public List<LecScoreVO> selectStatisticsList(LecScoreVO lecScoreVO) {
		return commonDAO.selectStatisticsList(lecScoreVO);
	}
	
}
