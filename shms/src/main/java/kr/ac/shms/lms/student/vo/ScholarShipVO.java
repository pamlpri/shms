package kr.ac.shms.lms.student.vo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import kr.ac.shms.common.vo.AttachVO;
import kr.ac.shms.common.vo.IAttachVO;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author 김보미
 * @since 2021. 6. 17.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일         수정자       수정내용
 * --------     --------    ----------------------
 * 2021. 6. 17.   김보미       최초작성
 * 2021. 6. 18.   김보미       파일 처리 위한 vo 추가
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class ScholarShipVO implements IAttachVO{
	private Integer req_no;
	private String reciv_date;
	private Integer reciv_amt;
	private String recivAmt;	// 가공한 장학금 수혜금액
	
	private String stdnt_no;
	private String req_de;
	private String req_resn;
	private String process_stat;
	private String papers_submit_at;
	private String refuse_resn;
	private Integer schlship_no;
	private String staff_no;
	
	private Integer reciv_year;		// 수혜년도
	private Integer semstr;		// 학기
	private String schlship_nm;		// 장학금 명
	private Integer rn;
	private String file_nm;
	private String name;
	private String benefit;
	private String proc_date;
	private String tel_no;
	private String webmail;
	
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
