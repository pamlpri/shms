package kr.ac.shms.lms.student.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(of="book_code")
public class BookVO {
	private String book_code;
	private String book_name;
	private String book_authr;
	private String book_pubcom;
	private Integer book_year;
	private String book_isbn;
	private String book_stat;
	private String book_stat_nm;
	
	// 도서 대출용
	private Integer loan_dtls_no;
	private String stdnt_no;
	private String loan_dt;
	private String return_exp_dt;
	private String return_dt;
}
