package kr.ac.shms.common.enumpkg;

public enum MimeType {
	JSON("application/json;charset=UTF-8"), 
	XML("application/xml;charset=UTF-8"), 
	PLAIN("text/plain;charset=UTF-8"), 
	HTML("text/html;charset=UTF-8");
	
	private MimeType(String mime) {
		this.mime = mime;
	}
	private String mime;
	public String getMime() {
		return mime;
	}
	
	public static MimeType searchMimeType(String accept) {
		accept = accept.toUpperCase();
		MimeType searched = HTML;
		for(MimeType tmp : values()) {
			if(accept.contains(tmp.name())) {
				searched = tmp;
				break;
			}
		}
		return searched;
	}
	public static String getMimiText(String accept) {
		return searchMimeType(accept).getMime();
	}
}












