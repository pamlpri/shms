package kr.ac.shms.common.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import kr.ac.shms.common.vo.AttachVO;
import kr.ac.shms.common.vo.IAttachVO;

@Repository
public interface CommonAttachDAO {
	/**
	 * 해당 게시글의 첨부파일 전체 출력
	 * @param bo_no
	 * @return 데이터가 없으면 null 반환
	 */
	public List<AttachVO> attachList(int param);
	
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
	public int insertAttatches(IAttachVO iattachVO);
	
	/**
	 * 첨부파일 삭제
	 * @param board
	 * @return
	 */
	public int deleteAttathes(IAttachVO iattachVO);
	
	/**
	 * 첨부파일 삭제하기 위한 이름 조회
	 * @param board
	 * @return 데이터가 없으면 null 반환
	 */
	public List<String> selectSaveNamesForDelete(IAttachVO iattachVO);	
	
	/**
	 * 첨부파일 없는 게시글 수정할 때 첨부파일 추가 시, 첨부파일 번호 새로 부여
	 * @param board  
	 * @return row count > 0 성공
	 */
	public int updateAtchNo(IAttachVO iattachVO);
	
	/**
	 * 해당 게시글의 첨부파일 순번 출력
	 * @param atch_file_no
	 * @return row count > 0 성공
	 */
	public int atch_file_seqCount(int atch_file_no);
}
