package kr.ac.shms.lms.student.controller;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.ac.shms.common.enumpkg.ServiceResult;
import kr.ac.shms.lms.login.vo.UserLoginVO;
import kr.ac.shms.lms.student.service.StudentService;
import kr.ac.shms.lms.student.vo.SugangLecSTVO;

/**
 * @author PC-24
 * @since 2021. 5. 31.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일        수정자      수정내용
 * --------     --------    ----------------------
 * 2021. 5. 31.  김보미      최초작성
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Controller
public class AttendanceController {
	@Inject
	private StudentService studentService;
	
	@RequestMapping("/lecture/qrGen.do")
	public String selectQRInfo(
			@AuthenticationPrincipal(expression="realUser") UserLoginVO user
			, @RequestParam("lec_code") String lec_code
			, HttpSession session
			, Model model
			) {
		
		SugangLecSTVO qrInfoVO = new SugangLecSTVO();
		qrInfoVO.setLec_code(lec_code);
		qrInfoVO.setStdnt_no(user.getUser_id());
		studentService.selectQRInfo(qrInfoVO);
		System.out.println("qr" + qrInfoVO);
		model.addAttribute("qrInfo", qrInfoVO);
		
		return "lecture/qrgenerator";
	}
	
	@RequestMapping("/lecture/qrScanner.do")
	public String insertAttendance(
			@RequestParam("qrcodedata") String qrcodeData
			, HttpSession session
			, Model model
			) {
		String[] arr = qrcodeData.split(",");
		System.out.println(arr.toString());
		String stdnt_no = arr[0];
		String lec_code = arr[1];
		System.out.println("stdnt_no : " + stdnt_no);
		System.out.println("lec_code :" + lec_code);
		
		SugangLecSTVO attendInfo = new SugangLecSTVO();
		attendInfo.setStdnt_no(stdnt_no);
		attendInfo.setLec_code(lec_code);
		
		String view = null;
		ServiceResult result = studentService.attend(attendInfo);
		if(ServiceResult.OK.equals(result)) {
			model.addAttribute("attendInfo", attendInfo);
			view = "lecture/qrResult";
		}else {
			view = "lecture/main";
		}
		return view;
	}
}
