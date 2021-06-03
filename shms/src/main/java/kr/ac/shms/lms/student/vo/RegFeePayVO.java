package kr.ac.shms.lms.student.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(of="stdnt_no")
public class RegFeePayVO {
	private Integer pay_dtls_no;
	private String stdnt_no;
	private Integer pay_amt;
	private String pay_dt;
	private Integer pay_year;
	private Integer pay_semstr;
}
