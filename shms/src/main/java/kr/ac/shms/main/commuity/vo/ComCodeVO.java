package kr.ac.shms.main.commuity.vo;

import java.util.List;

import kr.ac.shms.common.vo.SubjectVO;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ComCodeVO {
	private String code_grp;
	private String com_code;
	private String com_code_nm;
	private List<SubjectVO> subjectList;
}
