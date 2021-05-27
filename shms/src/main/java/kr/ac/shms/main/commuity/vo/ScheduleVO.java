package kr.ac.shms.main.commuity.vo;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(of="schdul_no")
public class ScheduleVO {
	private Integer schdul_no;
	private String sub_code;
	private String schdul_kind;
	private String title;
	private String cont;
	private String begin_dt;
	private String end_dt;
	
	private List<CalendarVO> calendarList;
}
