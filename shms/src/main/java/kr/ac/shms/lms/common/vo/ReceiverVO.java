package kr.ac.shms.lms.common.vo;

import java.io.Serializable;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@EqualsAndHashCode(of= "receiver")
public class ReceiverVO {
	private Integer send_no;
	private String receiver;
	private String cc_at;
	private String delete_at;
	
	public ReceiverVO(ReceiverVO receiverVO) {
		super();
		this.receiver = receiverVO.getReceiver();
	}
}
