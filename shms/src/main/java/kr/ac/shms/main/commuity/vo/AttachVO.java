package kr.ac.shms.main.commuity.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

/**
 * @author 송수미
 * @since 2021. 5. 27.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 5. 26.      송수미       최초작성
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(of= {"atch_file_no", "atch_file_seq"})
public class AttachVO {
	private Integer atch_file_no;
	private Integer atch_file_seq;
	private String file_nm;
	private String save_file_nm;
	private String file_path;
	private Integer file_size;
	private String reg_date;
	private String reg_user_id;
	private String file_cont_type;
	private String biz_type;
}
