package kr.ac.shms.lms.student.vo;

import java.util.ArrayList;
import java.util.List;

import javax.validation.constraints.NotNull;

import org.springframework.web.multipart.MultipartFile;

import kr.ac.shms.common.vo.AttachVO;
import kr.ac.shms.validator.TuitionRefundReqInsertGroup;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

/**
 * @author 김보미
 * @since 2021. 6. 12.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일        수정자       수정내용
 * --------     --------    ----------------------
 * 2021. 6. 12.  김보미       최초작성
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(of="pay_dtls_no")
public class TuitionVO {
	
	@NotNull(groups=TuitionRefundReqInsertGroup.class)
	private Integer pay_dtls_no;
	@NotNull(groups=TuitionRefundReqInsertGroup.class)
	private String stdnt_no;
	private String pay_amt;
	private String pay_dt;
	private Integer pay_year;
	private Integer pay_semstr;
	
	private String reginfo_stat;		// 학적 상태
	private String req_cl_code;		// 학적 상태
	private String reg_amt;		// 학과 수업료
	private Integer regAmt;
	private String schl;			// 장학금 
	
	private String sub_name;		// 학과이름
	private Integer grade;			// 학년
	private String reciv_amt;		// 장학금 수혜 금액
	private String year;			// 년도 
	private String tuition;		// 등록금
	private String name;		// 학생 이름
	private Integer month;		
	private Integer day;
	
	private String refund;		// 환불 가능 금액
	private String recivAmt;
	@NotNull(groups=TuitionRefundReqInsertGroup.class)
	private Integer refund_amt;
	@NotNull(groups=TuitionRefundReqInsertGroup.class, message="필수항목")
	private String req_resn;
	
	private Integer atch_file_no;
	
	private String bo_writer;
	private String biz_type;	
	private int startAttNo;
	private List<AttachVO> attachList;
	private MultipartFile[] common_files;
	public void setCommon_files(MultipartFile[] common_files) {
		this.common_files = common_files;
		if(common_files != null) {
			List<AttachVO> attachList = new ArrayList<>();
			for(MultipartFile file : common_files) {
				if(file.isEmpty()) continue;
				attachList.add(new AttachVO(file));
			}
			if(attachList.size() > 0){
				this.attachList = attachList;
			}
		}
	}
	private int[] delAttNos;
}
