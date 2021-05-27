package kr.ac.shms.main.commuity.vo;

import lombok.Data;
import lombok.Getter;

@Data
@Getter
public class CalendarVO {
	private String solar_date;
	private String datevale;
	private String lunar_date;
	private Integer year;
	private Integer month;
	private Integer day;
	private String dayofweek;
	private String yun;
	private String ganji;
	private String holiday;
	private String note;
}
