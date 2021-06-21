package kr.ac.shms.common.vo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(of="cng_req_no")
public class RegInfoCngVO implements IAttachVO{
	private Integer p_bo_no;	// 페이지 출력용 번호 (DB X)
	private Integer rn;
	
	private Integer cng_req_no;
	private String req_cl_code;
	private String req_cl_name;
	
	private String stdnt_no;
	private String stdnt_name;
	private String sub_name;
	
	private String req_de;
	private String process_stat;
	private String proc_date;
	private String refuse_resn;
	private Integer atch_file_no;
	
	private String req_resn_code;
	private String req_resn_code_name;
	private String cng_bgnde;
	private String cng_endde;
	
	private String papers_submit_at;	// 파일제출 상태 표시
	
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
