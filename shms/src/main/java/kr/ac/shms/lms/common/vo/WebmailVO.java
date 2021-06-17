package kr.ac.shms.lms.common.vo;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import kr.ac.shms.common.vo.AttachVO;
import kr.ac.shms.common.vo.IAttachVO;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

/**
 * @author 송수미
 * @since 2021. 6. 02.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일            수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 6. 2.      송수미       최초작성
 * 2021. 6. 3.		박초원 수정
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */

@Data
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(of="send_no")
@ToString(exclude="cont")
public class WebmailVO implements Serializable, IAttachVO{
	private Integer send_no;
	private String title;
	private String cont;
	private String read_at;
	private String sender;
	private String sender_name;
	private String sender_webmail;
	private String receiver;
	private String name;
	private String send_date;
	private String send_stat;
	private Integer atch_file_no;
	private String cc_at;
	private String delete_at;
	private String bo_writer;
	private String biz_type;
	
	private List<ReceiverVO> receiverList;
	
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
