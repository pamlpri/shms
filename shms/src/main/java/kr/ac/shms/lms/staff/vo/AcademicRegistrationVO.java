package kr.ac.shms.lms.staff.vo;

import java.util.Map;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class AcademicRegistrationVO {
	private String col_code;
	private String col_name;
	private String sub_code;
	private String sub_name;
	private String stdnt_no;
	private String name;
	private String regno1;
	private String gen;
	private String grade;
	private String semstr;
	private String reginfo_stat;
	private String entsch_de;
	private Map<String, Object> searchMap;
}
