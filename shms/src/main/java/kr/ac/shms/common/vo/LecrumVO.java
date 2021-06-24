package kr.ac.shms.common.vo;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(of="lecrum_no")
public class LecrumVO implements Serializable{
	private Integer lecrum_no;
	private Integer building_no;
	private String building_nm;
	private String pracrum_at;
	private String lecrum_nm;
	private Integer aceptnc_nmpr;
	private String posbl_at;
	private String sub_code;
}
