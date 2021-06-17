package kr.ac.shms.common.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public interface IAttachVO {
	public void setCommon_files(MultipartFile[] common_files);
	public void setAttachList(List<AttachVO> attachList);
	public List<AttachVO> getAttachList();
	public int[] getDelAttNos();
}
