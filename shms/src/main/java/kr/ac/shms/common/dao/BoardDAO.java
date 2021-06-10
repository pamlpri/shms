package kr.ac.shms.common.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

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
 * 수정일         수정자        수정내용
 * --------     --------    ----------------------
 * 2021. 5. 25.   송수미        최초작성
 * 2021. 5. 31.   최희수        첨부파일 등록 수정 삭제 작성
 * 2021. 6. 01.   송수미        교수의 강의문의 수 조회
 * 2021. 6.  4.   김보미		학과게시판
 * 2021. 6. 10.   최희수	   학과 문의 게시판
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Repository
public interface BoardDAO {
	
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
	 * 게시글 목록 조회(페이징처리 X)
	 * @param searchMap
	 * @return 해당 조건을 만족하는 페이징 처리가 되지 않은 전체 게시글 목록
	 */
	public List<BoardVO> selectAllBoardList(Map<String, String> searchMap);
	
	/**
	 * 하나의 게시글 조회
	 * @param bo_no
	 * @return 게시글 하나에 대한 상세 조회
	 */
	public BoardVO selectBoard(int bo_no);
	
	/**
	 * 게시글 등록
	 * @param board
	 * @return row count > 0 성공
	 */
	public int insertBoard(BoardVO board);
	
	/**
	 * 게시글 수정
	 * @param board
	 * @return row count > 0 성공
	 */
	public int updateBoard(BoardVO board);
	
	/**
	 * 게시글 삭제
	 * @param board
	 * @return row count > 0 성공
	 */
	public int deleteBoard(BoardVO board);
	
	/**
	 * 조회수 증가
	 * @param bo_no
	 * @return row count > 0 성공
	 */
	public int incrementHit(int bo_no);
	
	/**
	 * 해당 게시글의 첨부파일 전체 출력
	 * @param bo_no
	 * @return 데이터가 없으면 null 반환
	 */
	public List<AttachVO> attachList(int bo_no);
	
	/**
	 * 하나의 첨부파일 출력
	 * @param attachVO
	 * @return 데이터가 없으면 null 반환
	 */
	public AttachVO selectAttatch(AttachVO attachVO);
	
	/**
	 * 첨부파일 등록
	 * @param board
	 * @return row count > 0 성공
	 */
	public int insertAttatches(BoardVO board);
	
	/**
	 * 첨부파일 삭제
	 * @param board
	 * @return
	 */
	public int deleteAttathes(BoardVO board);
	
	/**
	 * 해당 게시글의 첨부파일 순번 출력
	 * @param atch_file_no
	 * @return row count > 0 성공
	 */
	public int atch_file_seqCount(int atch_file_no);
	
	/**
	 * 
	 * @param board
	 * @return 데이터가 없으면 null 반환
	 */
	public List<String> selectSaveNamesForDelete(BoardVO board);	
	
	/**
	 * 특정 조건에 만족하는 답변하지 않은 질문의 수 조회
	 * @param id 교수 번호
	 * @return 데이터가 없으면 0 반환
	 */
	public int selectQnaCnt(Map<String, String> search);
	
	/**
	 * 학과 게시판목록을 출력
	 * @param pagingVO bo_kind, searchMap, sub_code
	 * @return 게시글 목록 
	 */
	public List<BoardVO> selectHGBoardList(PagingVO<BoardVO> pagingVO);
	
	/**
	 * 학과 문의 게시판 출력
	 * @return 데이터가 없으면 null
	 */
	public List<BoardVO> subQnaBoardList();
	
	/**
	 * 학과 문의 게시판 상세 정보 출력
	 * @param bo_no
	 * @return 데이터가 없으면 null
	 */
	public BoardVO subQnaBoard(String bo_no);
	
	/**
	 * 학과 문의 게시판 답글 달기
	 * @param boardVO
	 * @return cnt > 0 성공
	 */
	public int subQnaBoardAnsUpdate(BoardVO boardVO);
	
	/**
	 * 학과 문의 게시글 삭제
	 * @param bo_no
	 * @return cnt > 0 성공
	 */
	public int subQnaBoardAnsDelete(int bo_no);
}
