package kr.ac.shms.common.service.impl;

import java.io.ByteArrayInputStream;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.net.ftp.FTP;
import org.apache.commons.net.ftp.FTPClient;
import org.apache.commons.net.ftp.FTPReply;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import kr.ac.shms.common.dao.BoardDAO;
import kr.ac.shms.common.dao.CommonAttachDAO;
import kr.ac.shms.common.enumpkg.ServiceResult;
import kr.ac.shms.common.service.BoardService;
import kr.ac.shms.common.vo.AttachVO;
import kr.ac.shms.common.vo.BoardVO;
import kr.ac.shms.common.vo.PagingVO;

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
 * 2021. 5. 31.      최희수        첨부파일 다운로드 기능 구현
 * 2021. 6. 01.      송수미       교수의 강의문의 수 조회
 * 2021. 6. 09.      송수미       학과 공지 게시글 등록, 조회
 * 2021. 6. 10.      송수미       학과 공지 게시글 수정, 삭제
 * 2021. 6. 10.      최희수	학과 문의 게시판 답글 등록, 수정, 삭제
 * 2021. 6. 11.      송수미       학과 공지 첨부파일 오류 수정
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
	
	@Inject
	private CommonAttachDAO commonAttachDAO; 
	
	@Inject
	private CommonAttachServiceImpl commonAttachServiceImpl; 
	
	@Value("#{appInfo['ip']}")
	private String ip;
	@Value("#{appInfo['port']}")
	private int port;
	@Value("#{appInfo['id']}")
	private String id;
	@Value("#{appInfo['pw']}")
	private String pw;
	
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
	public List<BoardVO> selectAllBoardList(Map<String, String> searchMap) {
		return boardDAO.selectAllBoardList(searchMap);
	}	
	
	@Override
	public BoardVO selectBoard(int bo_no) {
		boardDAO.incrementHit(bo_no);
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
		
		if(cnt > 0) {
			cnt += commonAttachServiceImpl.processes(board, "/" + board.getBo_kind() + "board");
			
			if(cnt > 0) {
				result = ServiceResult.OK;
			}
		}
		return result;
	}

	@Override
	public ServiceResult updateBoard(BoardVO board) {
		ServiceResult result = ServiceResult.FAIL;
		int cnt = 0;
		
		BoardVO savedBoard = boardDAO.selectBoard(board.getBo_no());
		boolean authChk = true;
		
		if(savedBoard == null) {
			result = ServiceResult.NOTEXIST;
		}else {
			if(savedBoard.getBo_password()!=null) {
				authChk = boardAuth(board);
			}
			
			if(!authChk) {
				result = ServiceResult.INVALIDPASSWORD;
			}else {
				if(savedBoard.getAtch_file_no() == null) {
					commonAttachDAO.updateAtchNo(board);
				}
				cnt = boardDAO.updateBoard(board);
				if(cnt > 0) {
					cnt += commonAttachServiceImpl.processes(board, "/" + board.getBo_kind() + "board");
					cnt += commonAttachServiceImpl.deleteFileProcesses(board, "/" + board.getBo_kind() + "board");
					if(cnt > 0) {
						result = ServiceResult.OK;
					}
				}
			}
		}
		
		return result;
	}

	@Override
	public ServiceResult deleteBoard(BoardVO board) {
		BoardVO savedBoard = boardDAO.selectBoard(board.getBo_no());
		ServiceResult result = ServiceResult.FAIL;
		
		if(savedBoard == null) {
			result = ServiceResult.NOTEXIST;
		}else {
			int cnt = boardDAO.deleteBoard(board);
			if(cnt > 0) {
				cnt += commonAttachServiceImpl.deleteFileProcesses(board, "/" + board.getBo_kind() + "board");
				if(cnt > 0) {
					result = ServiceResult.OK;
				}
			}
			
		}
		
		
		return result;
	}


	@Override
	public int selectQnaCnt(Map<String, String> search) {
		return boardDAO.selectQnaCnt(search);
	}

	@Override
	public List<BoardVO> selectHGBoardList(PagingVO<BoardVO> pagingVO) {
		return boardDAO.selectHGBoardList(pagingVO);
	}

	@Override
	public List<BoardVO> subQnaBoardList() {
		return boardDAO.subQnaBoardList();
	}

	@Override
	public BoardVO subQnaBoard(String bo_no) {
		return boardDAO.subQnaBoard(bo_no);
	}

	@Override
	public ServiceResult subQnaBoardAnsUpdate(BoardVO boardVO) {
		ServiceResult result = ServiceResult.FAIL;
		int cnt = boardDAO.subQnaBoardAnsUpdate(boardVO);
		if(cnt > 0) { result = ServiceResult.OK; }
		return result;
	}

	@Override
	public ServiceResult subQnaBoardAnsDelete(int bo_no) {
		ServiceResult result = ServiceResult.FAIL;
		int cnt = boardDAO.subQnaBoardAnsDelete(bo_no);
		if(cnt > 0) { result = ServiceResult.OK; }
		return result;
	}
	
}
