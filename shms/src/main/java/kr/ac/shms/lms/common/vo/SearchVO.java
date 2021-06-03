package kr.ac.shms.lms.common.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 검색 조건과 검색 키워드를 이용한 단순 검색에 사용.
 *
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class SearchVO {
	private String searchType;
	private String searchWord;
}
