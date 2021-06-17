package kr.ac.shms.common.service;

import java.util.List;

import kr.ac.shms.common.vo.AttachVO;

public interface CommonAttachService {
	/**
	 * 해당 게시글의 첨부파일 전체 출력
	 * @param bo_no
	 * @return 데이터가 없으면 null 반환
	 */
	public List<AttachVO> attachList(int param);
	
	/**
	 * 첨부파일 다운로드
	 * @param attachVO
	 * @return 데이터가 없으면 null 반환
	 */
	public AttachVO download(AttachVO attachVO, String use_type);
	
	/**
	 * 해당 게시글의 첨부파일 순번 출력
	 * @param atch_file_no
	 * @return row count > 0 성공
	 */
	public int atch_file_seqCount(int atch_file_no);
	
}
