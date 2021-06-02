package kr.ac.shms.main.commuity.vo;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

/**
 * @author 최희수
 * @since 2021. 5. 27.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 5. 27.      최희수       최초작성
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
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
