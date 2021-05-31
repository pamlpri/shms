package kr.ac.shms.main.commuity.service.impl;

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

import kr.ac.shms.common.enumpkg.ServiceResult;
import kr.ac.shms.main.commuity.dao.BoardDAO;
import kr.ac.shms.main.commuity.service.BoardService;
import kr.ac.shms.main.commuity.vo.AttachVO;
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
 * 2021. 5. 31.      최희수        첨부파일 다운로드 기능 구현
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

	@Override
	public List<AttachVO> attachList(int bo_no) {
		return boardDAO.attachList(bo_no);
	}

	@Override
	public int atch_file_seqCount(int atch_file_no) {
		return boardDAO.atch_file_seqCount(atch_file_no);
	}

	@Override
	public AttachVO download(AttachVO attachVO) {
		AttachVO attatch = boardDAO.selectAttatch(attachVO);
		return attatch;
	}
	
	private int processes(BoardVO board) {
		int cnt = 0;		
		List<AttachVO> attachList = board.getAttachList();
		if(attachList!=null && attachList.size()>0) {
		
			FTPClient client = new FTPClient();
			try {
				client.connect(ip, port);
				int reply = client.getReplyCode();
				logger.info("client Connect : {}", reply);
				if(FTPReply.isPositiveCompletion(reply)) { // 접속 연결이 됐을 경우 
					if(client.login(id, pw)) {	// FTP 서버 로그인 성공 했을 경우
						System.out.println("Login Success");
						client.setBufferSize(1000);	// 버퍼 사이즈
						client.enterLocalPassiveMode();	// 공유기를 상대로 파일 전송하기 위해 패시브 모드로 지정해줘야함
						
						String dir = "/test"; // 해당 게시판에 따라 dir 이 달라져야함
						boolean isDirectory = client.changeWorkingDirectory(dir);	// 파일 경로 지정
						for(AttachVO attach : attachList) {
							attach.setFile_path(dir);
						}
						logger.info("isDir : {} || {}",isDirectory, dir);
						if(!isDirectory) {
							client.mkd(dir);
						}
						client.setFileType(FTP.BINARY_FILE_TYPE);
						
						boolean isUpload = false;
						for(AttachVO attvo : board.getAttachList()) {
							isUpload = client.storeFile(attvo.getSave_file_nm(), new ByteArrayInputStream(attvo.getFile().getBytes()));
							if(!isUpload) {
								client.logout();
								break;
							}
						}
						if(isUpload) cnt += boardDAO.insertAttatches(board);
						
						client.logout();
						client.disconnect();
					} else {
						client.disconnect(); // 연결 종료
					}
				}
			} catch(Exception e) {
				
			}
		}
		return cnt;
	}
	
	private int deleteFileProcesses(BoardVO board) {
		logger.info("deleteFileProcesses : {}", board);
		FTPClient client = new FTPClient();
		int cnt = 0;
		int[] delAttNos = board.getDelAttNos();
		if(delAttNos!=null && delAttNos.length > 0) {
			List<String> saveNames = boardDAO.selectSaveNamesForDelete(board);
			logger.info("saveNames : {}", saveNames.size());
			try {
				client.connect(ip, port);
				int reply = client.getReplyCode();
				logger.info("client Connect : {}", reply);
				if(FTPReply.isPositiveCompletion(reply)) { // 접속 연결이 됐을 경우 
					if(client.login(id, pw)) {	// FTP 서버 로그인 성공 했을 경우
						System.out.println("Login Success");
						client.setBufferSize(1000);	// 버퍼 사이즈
						client.enterLocalPassiveMode();	// 공유기를 상대로 파일 전송하기 위해 패시브 모드로 지정해줘야함
						
						String dir = "/test";
						boolean isDirectory = client.changeWorkingDirectory(dir);	// 파일 경로 지정
						logger.info("isDir : {} || {}",isDirectory, dir);
//						if(!isDirectory) {
//							client.mkd(attatchPath);
//						}
						client.setFileType(FTP.BINARY_FILE_TYPE);
						
//						이진 데이터 삭제
						for(String saveName : saveNames) {
							client.deleteFile(saveName);
						}
//						첨부파일의 메타 데이터 삭제
						boardDAO.deleteAttathes(board);
						
						
						client.logout();
						client.disconnect();
					} else {
						client.disconnect(); // 연결 종료
					}
				}
			} catch(Exception e) {
				
			}
		}
		return cnt;
	}

	
}
