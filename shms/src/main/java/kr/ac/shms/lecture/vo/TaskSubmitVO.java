package kr.ac.shms.lecture.vo;

import java.util.ArrayList;
import java.util.List;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import org.springframework.web.multipart.MultipartFile;

import kr.ac.shms.common.vo.AttachVO;
import kr.ac.shms.validator.TaskInsertGroup;
import kr.ac.shms.validator.TaskUpdateGroup;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(of="submit_no")
public class TaskSubmitVO {
	private Integer p_bo_no;	// 페이지 상의 게시글 번호(DB 저장X)
	@NotNull(groups= {TaskUpdateGroup.class})
	@Min(value=1, groups= {TaskUpdateGroup.class})
	private Integer submit_no;
	private Integer set_task_no;
	
	@NotBlank(groups= {TaskInsertGroup.class, TaskUpdateGroup.class})
	private String title;
	@NotBlank(groups={TaskInsertGroup.class, TaskUpdateGroup.class})
	private String cont;
	private String writer;		// 학번
	private String name; 		// 이름
	private String sub_name;	// 학과명
	private String submit_dt;
	private Integer task_score;
	private Integer atch_file_no;
	private String lec_code;
	
	private int startAttNo;
	private List<AttachVO> attachList;
	private MultipartFile[] task_submit_files;
	public void setTask_submit_files(MultipartFile[] task_submit_files) {
		System.out.println("task_submit_files : "+ task_submit_files.length);
		this.task_submit_files = task_submit_files;
		if(task_submit_files!=null) {
			List<AttachVO> attatchList = new ArrayList<>();
			for(MultipartFile file : task_submit_files) {
				if(file.isEmpty()) continue;
				attatchList.add(new AttachVO(file));
			}
			if(attatchList.size()>0)
				this.attachList = attatchList;
		}
	}
	private int[] delAttNos;
}
