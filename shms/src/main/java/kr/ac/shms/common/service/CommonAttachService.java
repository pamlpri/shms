package kr.ac.shms.common.service;

import java.util.List;

import kr.ac.shms.common.vo.AttachVO;
import kr.ac.shms.common.vo.IAttachVO;

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
	
	/**
	 * 첨부파일 등록 처리
	 * @param iattachVO
	 * @param dir
	 * @return 등록된 처리 수
	 */
	public int processes(IAttachVO iattachVO, String dir);
	
	/**
	 * 첨부파일 삭제 처리
	 * @param iattachVO
	 * @param dir
	 * @return 삭제 처리된 수
	 */
	public int deleteFileProcesses(IAttachVO iattachVO, String dir);
}
