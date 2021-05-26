package kr.ac.shms.admission.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author 박초원
 * @since 2021. 5. 20.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 5. 20.      박초원      	 최초작성
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */

@Controller  
public class AdmissionIndexContoller {
	@RequestMapping("/admission/main.do")
	public String index() {
		return "admission/main";
	}
}
