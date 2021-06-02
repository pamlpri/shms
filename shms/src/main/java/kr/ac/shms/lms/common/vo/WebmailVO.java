package kr.ac.shms.lms.common.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(of="send_no")
public class WebmailVO {
	private Integer total_cnt;
	private Integer send_no;
	private String title;
	private String cont;
	private String read_at;
	private String sender;
	private String receiver;
	private String receiver_name;
	private String send_date;
	private String send_stat;
	private Integer atch_file_no;
	private String cc_at;
}
