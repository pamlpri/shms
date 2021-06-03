package kr.ac.shms.common.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(of="cng_req_no")
public class RegInfoCngVO {
	private Integer p_bo_no;	// 페이지 출력용 번호 (DB X)
	
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
	
}
