package kr.ac.shms.subject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

/**
 * @author 김보미
 * @since 2021. 6. 5.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일        수정자        수정내용
 * --------     --------    ----------------------
 * 2021. 6. 5.   김보미        최초작성
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Controller
@SessionAttributes("sub_code")
public class SubjectQnaDeleteController {
	@RequestMapping("/subject/subjectQnaDelete.do")
	public String subjectQnaDelete(
			@SessionAttribute(name="sub_code", required=false) String sub_code
			, Model model
			) {
		
		model.addAttribute("sub_code", sub_code);
		return null;
	}
}
