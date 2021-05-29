package kr.ac.shms.main.commuity.service;

import java.util.List;
import java.util.Map;

import kr.ac.shms.common.enumpkg.ServiceResult;
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
 * 2021. 5. 28.      송수미       인증하는 메서드 작성
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
public interface BoardService {
	/**
	 * board에 대한 인증 작업을 진행
	 * @param search bo_writer, bo_pass, bo_no
	 * @return bo_no에 해당하는 게시글의 저장되어 있는 정보와 파라미터로 들어온 정보를 비교한 결과값
	 */
	public boolean boardAuth(BoardVO search);
	/**
	 * bo_name을 가공해서 bo_kind 조회
	 * @param bo_name
	 * @return bo_kind 가공해서 출력된 공통코드값
	 */
	public String selectBoKind(String bo_name);
	/**
	 * Main page 띄우기 위한 게시글 조회
	 * @param search 게시글 분류 명
	 * @return bo_kind에 해당하는 게시글의 최근 5개 글
	 */
	public List<BoardVO> selectForMain(Map<String, String> search);
	/**
	 * 게시글 개수 조회
	 * @param pagingVO bo_kind, searchMap
	 * @return 해당 조건을 만족하는 게시글의 수
	 */
	public int selectBoardCount(PagingVO<BoardVO> pagingVO);
	/**
	 * 게시글 목록 조회
	 * @param pagingVO bo_kind, searchMap
	 * @return 해당 조건을 만족하는 전체 게시글
	 */
	public List<BoardVO> selectBoardList(PagingVO<BoardVO> pagingVO);
	/**
	 * 비밀글일 경우 비밀번호 비교 후 하나의 게시글 조회
	 * @param bo_no
	 * @return 게시글 하나에 대한 상세 조회
	 */
	public BoardVO selectBoard(int bo_no);
	/**
	 * 게시글 등록
	 * @param board
	 * @return OK, FAIL, PKDUPLICATED
	 */
	public ServiceResult insertBoard(BoardVO board);
	/**
	 * 게시글 수정
	 * @param board
	 * @return OK, FAIL, NOTEXIST, INVALIDPASSWORD
	 */
	public ServiceResult updateBoard(BoardVO board);
	/**
	 * 게시글 삭제
	 * @param bo_no
	 * @return OK, FAIL, NOTEXIST, INVALIDPASSWORD
	 */
	public ServiceResult deleteBoard(int bo_no);
	/**
	 * 조회수 증가
	 * @param bo_no
	 * @return OK, FAIL, NOTEXIST
	 */
	public ServiceResult incrementHit(int bo_no);
}
