package kr.ac.shms.lms.student.vo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import kr.ac.shms.common.vo.AttachVO;
import kr.ac.shms.common.vo.IAttachVO;
import kr.ac.shms.lms.common.vo.ReceiverVO;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class EditReqVO implements IAttachVO {
	private Integer edit_req_no;
	private String req_title;
	private String req_de;
	private String stdnt_no;
	private String req_cont;
	private String process_stat;
	private String com_code_nm;
	private String edit_date;
	private String refuse_resn;
	private Integer atch_file_no;
	
	private String bo_writer;
	private String biz_type;	
	private int startAttNo;
	private List<AttachVO> attachList;
	private MultipartFile[] common_files;
	public void setCommon_files(MultipartFile[] common_files) {
		this.common_files = common_files;
		if(common_files != null) {
			List<AttachVO> attachList = new ArrayList<>();
			for(MultipartFile file : common_files) {
				if(file.isEmpty()) continue;
				attachList.add(new AttachVO(file));
			}
			if(attachList.size() > 0){
				this.attachList = attachList;
			}
		}
	}
	private int[] delAttNos;
}
