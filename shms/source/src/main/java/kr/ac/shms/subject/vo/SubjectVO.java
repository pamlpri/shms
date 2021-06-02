package kr.ac.shms.subject.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(of="sub_code")
public class SubjectVO {
	private String sub_code;
	private String sub_name;
	private String col_code;
	private String estbl_de;
	private String offrum_loc;
	private String tel_no;
	private String fax_no;
	private Integer grdtn_pnt;
	private String staff_no;	// 학과장 교수 번호
	private Integer reg_amt;
	private String sub_index;
}
