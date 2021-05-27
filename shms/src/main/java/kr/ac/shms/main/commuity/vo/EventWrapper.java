package kr.ac.shms.main.commuity.vo;

import lombok.Getter;

@Getter
public class EventWrapper {
	private ScheduleVO adaptee;
	private Integer id;
	private String title;
	private String start;
	private String end;
	private String color;
	private String textColor;
	private boolean editable;
	
	public EventWrapper(ScheduleVO adaptee) {
		super();
		this.adaptee = adaptee;
		this.title = adaptee.getCont();
		this.id = adaptee.getSchdul_no();
		this.start = adaptee.getBegin_dt();
		this.end = adaptee.getEnd_dt();
	}

	public EventWrapper() {
		super();
		this.color = "#FF0000";
		this.editable = false;
	} 
}
