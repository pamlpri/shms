package kr.ac.shms.main.commuity.vo;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author 송수미
 * @since 2021. 5. 27.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 5. 25.      송수미       최초작성
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Data
@NoArgsConstructor
public class PagingVO<T> implements Serializable{
	
	public PagingVO(int screenSize, int blockSize) {
		super();
		this.screenSize = screenSize;
		this.blockSize = blockSize;
	}

	private int totalRecord;
	private int screenSize = 10;
	private int blockSize = 5;
	private int currentPage;
	
	private int totalPage;
	private int startRow;
	private int endRow;
	private int startPage;
	private int endPage;
	private List<T> dataList;
	
	private Map<String, Object> searchMap;
	
	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
		totalPage = totalRecord % screenSize == 0 ?
							totalRecord/screenSize :
							totalRecord/screenSize + 1;
	}
	
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
		startRow = (currentPage - 1)*screenSize + 1;
		endRow = currentPage * screenSize;
		endPage = (currentPage+(blockSize-1))/blockSize * blockSize;
		startPage = endPage - (blockSize - 1);
	}
	
	private static String pageItem = "<li class='page-item %s' %s>"
			+"<a class='page-link %s'  href='#' data-page='%d'>%s</a>"
			+ "</li>";

	public String getPagingHTMLBS() {
		StringBuffer html = new StringBuffer();
		html.append("<nav aria-label='Page navigation example' class='pagination'>");
		html.append("<ul class='pagination justify-content-center'>");
		String first = null;
		String second = null;
		String third = null;
		int fourth = -1;
		String fifth = "<<";
		if(startPage >= 1) {
			first = "";
			second = "";
			third = "";
			fourth = startPage - 1;
		}else {
			first ="disabled";
			second = "tabindex='-1' aria-disabled='true'";
			third = "";
			fourth = -1;
		}
		html.append(
			String.format(pageItem, first, second, third, fourth, fifth)	
		);
		endPage = endPage < totalPage ? endPage : totalPage;
		for(int page = startPage; page <= endPage; page++) {
			second = "";
			third = "";
			fourth = page;
			fifth = page + "";
			if(page == currentPage) {
				third = "cur";
			}else {
				first = "";
				third = "";
			}
			html.append(
				String.format(pageItem, first, second, third, fourth, fifth)	
			);
		}
		fifth = ">>";
		if(endPage < totalPage) {
			first = "";
			second = "";
			third = "";
			fourth = endPage + 1;
		}else {
			first ="disabled";
			second = "tabindex='-1' aria-disabled='true'";
			third = "";
			fourth = -1;
		}
		html.append(
			String.format(pageItem, first, second, third, fourth, fifth)	
		);
		html.append("</ul>");
		html.append("</nav>");
		return html.toString();
	}
}









