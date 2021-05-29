package kr.ac.shms.main.commuity.service.impl;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import kr.ac.shms.common.enumpkg.ServiceResult;
import kr.ac.shms.main.commuity.dao.BoardDAO;
import kr.ac.shms.main.commuity.service.BoardService;
import kr.ac.shms.main.commuity.vo.BoardVO;
import kr.ac.shms.main.commuity.vo.PagingVO;

/**
 * @author 송수미
 * @since 2021. 5. 25.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 5. 25.      송수미       최초작성
 * 2021. 5. 28.      송수미       학사문의 게시글 등록 구현
 * 2021. 5. 29.      송수미       학사문의 게시글 비밀번호 인증, 삭제 기능 구현
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Service
public class BoardServiceImpl implements BoardService{
	
	private static final Logger logger = LoggerFactory.getLogger(BoardServiceImpl.class);
	@Inject
	private PasswordEncoder encoder;
	
	@Inject
	private BoardDAO boardDAO;
	
	@Override
	public boolean boardAuth(BoardVO search) {
		int bo_no = search.getBo_no();
		boolean authChk = true;
		
		String inputWriter = search.getBo_writer();
		String inputPass = search.getBo_password();
		
		BoardVO saveBoard = boardDAO.selectBoard(bo_no);
		String saveWriter = saveBoard.getBo_writer(); 
		String savePass = saveBoard.getBo_password();
		
		if(StringUtils.isNotBlank(inputWriter)) {
			
			if(!(saveWriter.equals(inputWriter))) authChk = false; 
		}
		
		if(!(encoder.matches(inputPass, savePass))) authChk = false;
		
		return authChk;
	}

	@Override
	public String selectBoKind(String bo_name) {
		return boardDAO.selectBoKind(bo_name);
	}

	@Override
	public List<BoardVO> selectForMain(Map<String, String> search) {
		return boardDAO.selectForMain(search);
	}

	@Override
	public int selectBoardCount(PagingVO<BoardVO> pagingVO) {
		return boardDAO.selectBoardCount(pagingVO);
	}

	@Override
	public List<BoardVO> selectBoardList(PagingVO<BoardVO> pagingVO) {
		return boardDAO.selectBoardList(pagingVO);
	}

	@Override
	public BoardVO selectBoard(int bo_no) {
		return boardDAO.selectBoard(bo_no);
	}

	@Override
	public ServiceResult insertBoard(BoardVO board) {
		String bo_pass = board.getBo_password();
		ServiceResult result = ServiceResult.FAIL;
		
		if(StringUtils.isNotBlank(bo_pass)) {
			String encoded = encoder.encode(board.getBo_password());
			board.setBo_password(encoded);
		}
		
		int cnt = boardDAO.insertBoard(board);
		if(cnt > 0) result = ServiceResult.OK;
		return result;
	}

	@Override
	public ServiceResult updateBoard(BoardVO board) {
		ServiceResult result = ServiceResult.FAIL;
		int cnt = 0;
		
		BoardVO savedBoard = boardDAO.selectBoard(board.getBo_no());
		
		if(savedBoard == null) {
			result = ServiceResult.NOTEXIST;
		}else {
			boolean authChk = boardAuth(board);
			
			if(!authChk) {
				result = ServiceResult.INVALIDPASSWORD;
			}else {
				cnt = boardDAO.updateBoard(board);
				if(cnt > 0) {
					result = ServiceResult.OK;
				}else {
					result = ServiceResult.FAIL;
				}
			}
		}
		
		return result;
	}

	@Override
	public ServiceResult deleteBoard(int bo_no) {
		ServiceResult result = ServiceResult.FAIL;
		int cnt = boardDAO.deleteBoard(bo_no);
		
		if(cnt > 0) result = ServiceResult.OK;
		
		return result;
	}

	@Override
	public ServiceResult incrementHit(int bo_no) {
		
		ServiceResult result = ServiceResult.FAIL;
		int cnt = boardDAO.incrementHit(bo_no);
		if(cnt > 0) result = ServiceResult.OK;
		
		return result;
	}

	
}
