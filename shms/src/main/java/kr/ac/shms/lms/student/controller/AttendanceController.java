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
	
	
	
//	@RequestMapping("/lecture/qrGen.do")
//	public String insertAttendance(
//			@AuthenticationPrincipal(expression="realUser") UserLoginVO user
//			, @RequestParam("lec_code") String lec_code
//			, HttpSession session
//			, Model model
//			) {
//		Map<String, String> attendInfomap =  new HashMap<>();
//		attendInfomap.put("lec_code", lec_code);
//		attendInfomap.put("stdnt_no", user.getUser_id());
//		
//		String view = null;
//		ServiceResult result = studentService.attend(attendInfomap);
//		if(ServiceResult.OK.equals(result)) {
//			model.addAttribute("attendInfo", attendInfomap);
//			view = "qrgenerator";
//		}else {
//			view = "lecture/main";
//		}
//		return view;
//	}
}
