package kr.ac.shms.lms.common.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(of="diet_no")
public class DietVO {
	private Integer diet_no;
	private String diet_date;
	private String diet_menu1;
	private String diet_menu2;
	private String diet_menu3;
	private String diet_menu4;
	private String diet_menu5;
	private String diet_menu6;
	private String diet_menu7;
}
