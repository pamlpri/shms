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
	
	public boolean boardAuth(BoardVO search) {
		// TODO Auto-generated method stub
		return false;
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
		
		String bo_pass = board.getBo_password();
		BoardVO savedBoard = boardDAO.selectBoard(board.getBo_no());
		if(savedBoard == null) {
			result = ServiceResult.NOTEXIST;
		}else {
			String saved_pass = savedBoard.getBo_password(); 
			boolean passChk = encoder.matches(bo_pass, saved_pass);
			
			if(!passChk) {
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
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ServiceResult incrementHit(int bo_no) {
		
		ServiceResult result = ServiceResult.FAIL;
		int cnt = boardDAO.incrementHit(bo_no);
		if(cnt > 0) result = ServiceResult.OK;
		
		return result;
	}

	
}
