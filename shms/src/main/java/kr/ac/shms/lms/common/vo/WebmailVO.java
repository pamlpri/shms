package kr.ac.shms.lms.common.vo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import kr.ac.shms.common.vo.AttachVO;
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
public class WebmailVO {
	private Integer send_no;
	private String title;
	private String cont;
	private String read_at;
	private String sender;
	private String receiver;
	private String name;
	private String send_date;
	private String send_stat;
	private Integer atch_file_no;
	private String cc_at;
	private String delete_at;
	
	private List<ReceiverVO> receiverList;
	private ReceiverVO[] receivers;
	public void setReceivers(ReceiverVO[] receivers) {
		this.receivers = receivers;
		if(receivers != null) {
			List<ReceiverVO> receiverList = new ArrayList<>();
			for(ReceiverVO receiverVO : receiverList) {
				if(receiverVO == null) continue;
				receiverList.add(new ReceiverVO(receiverVO));
			}
			if(receiverList.size() > 0) {
				this.receiverList = receiverList;
			}
		}
	}
	
	private int startAttNo;
	private List<AttachVO> attachList;
	private MultipartFile[] mail_files;
	public void setMail_files(MultipartFile[] mail_files) {
		this.mail_files = mail_files;
		if(mail_files != null) {
			List<AttachVO> attachList = new ArrayList<>();
			for(MultipartFile file : mail_files) {
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
