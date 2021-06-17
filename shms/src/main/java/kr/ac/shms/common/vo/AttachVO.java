package kr.ac.shms.common.vo;

import java.io.Serializable;
import java.util.UUID;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

/**
 * @author 송수미
 * @since 2021. 5. 27.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 5. 26.     송수미       최초작성
 * 2021. 5. 31.		최희수	수정
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Data
@NoArgsConstructor
@EqualsAndHashCode(of="atch_file_no")
@ToString(exclude="file")
public class AttachVO implements Serializable{
	private String file_cont_type;
	private long file_size;
	private Integer atch_file_no;
	private Integer atch_file_seq;
	private String file_path;
	private String file_nm;
	private String reg_date;
	private String reg_user_id;
	private String biz_type;
	private String save_file_nm;
	private String use_type;
	
	private transient MultipartFile file;
	public AttachVO(MultipartFile file) {
		super();
		this.file = file;
		this.file_nm = file.getOriginalFilename();
		this.save_file_nm = UUID.randomUUID().toString();
		this.file_cont_type = file.getContentType();
		this.file_size = file.getSize();
	}
}