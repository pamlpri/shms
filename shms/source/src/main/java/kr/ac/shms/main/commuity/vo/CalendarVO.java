package kr.ac.shms.main.commuity.vo;

import lombok.Data;
import lombok.Getter;

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
