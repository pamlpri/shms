package kr.ac.shms.lms.student.controller;

import java.util.Date;

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
import kr.ac.shms.lms.student.vo.AttendVO;
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
 * 2021. 6. 01.  김보미		 출석(퇴실)
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
		
		AttendVO qrInfoVO = new AttendVO();
		qrInfoVO.setLec_code(lec_code);
		qrInfoVO.setStdnt_no(user.getUser_id());
		studentService.selectQRInfo(qrInfoVO);
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
		String stdnt_no = arr[0];
		String lec_code = arr[1];
		
		AttendVO attendVO = new AttendVO();
		attendVO.setStdnt_no(stdnt_no);
		attendVO.setLec_code(lec_code);
		String attend_time = studentService.selectAttendTime(attendVO);
		
		AttendVO attendInfo = new AttendVO();
		attendInfo.setStdnt_no(stdnt_no);
		attendInfo.setLec_code(lec_code);
		AttendVO vo = new AttendVO();
		int stdnt_atndan_time = vo.getStdnt_atndan_time();	// 학생 출석 시간 = 퇴실시간 - 입실시간
		int tm = vo.getTm();	// 강의 시작 시간
		int finish_lec = vo.getFinish_lec();	// 강의 종료 시간
		int total_lec_time = vo.getTotal_lec_time();	// 총 강의 시간
		int stdnt_exit_time = vo.getStdnt_exit_time();	// 학생 퇴실 시간
		int stdnt_attend_time = vo.getStdnt_attend_time();	// 학생 입실 시간
		
		if(total_lec_time - stdnt_atndan_time < 0 && finish_lec - stdnt_exit_time < 15 * 24 * 60 * 60 
				&& stdnt_attend_time - tm < 15) {
			
		}
		String view = null;
		ServiceResult result = null;
		if(attend_time == null) {
			result = studentService.attend(attendInfo);
			if(ServiceResult.OK.equals(result)) {
				model.addAttribute("attendInfo", attendInfo);
				model.addAttribute("attend_time", attend_time);
				view = "lecture/qrResult";
			}else {
				view = "lecture/main";
			}
		}else {
			result = studentService.exit(attendInfo);
			if(ServiceResult.OK.equals(result)) {
				model.addAttribute("attendInfo", attendInfo);
				model.addAttribute("attend_time", attend_time);
				view = "lecture/qrResult";
			}else {
				view = "lecture/main";
			}
		}
		return view;
	}
}

