package kr.ac.shms.lms.student.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.ac.shms.common.enumpkg.ServiceResult;
import kr.ac.shms.lms.login.vo.UserLoginVO;
import kr.ac.shms.lms.student.service.StudentService;
import kr.ac.shms.lms.student.vo.AttendVO;

@Controller
public class AttendanceUpdateController {
	private static final Logger logger = LoggerFactory.getLogger(AttendanceUpdateController.class);
	@Inject
	private StudentService studentService;
	
	@RequestMapping("/lecture/updateAttendanceStat.do")
	public String attendanceStatUpdate(
		@AuthenticationPrincipal(expression="realUser") UserLoginVO user
		, @RequestParam("stdnt_no") String stdnt_no
		, @RequestParam("lec_code") String lec_code
		, @RequestParam("attend_time") String attend_time
		, @RequestParam("exit_time") String exit_time
		, Model model
		) {
		AttendVO atVo = new AttendVO();
		atVo.setStdnt_no(stdnt_no);
		atVo.setLec_code(lec_code);
		
		ServiceResult attendResult = studentService.selectCountAttend(atVo);
		ServiceResult exitResult = studentService.selectCountExit(atVo);
		
		// 출석 상태 update하기
		AttendVO studentInfo = new AttendVO();
		studentInfo.setStdnt_no(stdnt_no);
		studentInfo.setLec_code(lec_code);
		logger.info("studentInfo {}", studentInfo);
		
		AttendVO vo = studentService.selectAttendInfo(studentInfo);
		logger.info("vo {}", vo);
		int total_lec_time = vo.getTotal_lec_time();	// 총 강의 시간(분)
		int attend_check = vo.getAttend_check();		// 출석인정시간(분)
		Double start_check = vo.getStart_check();			// 강의시작시간-입실시간(분)
		int finish_check = vo.getFinish_check();		// 퇴실시간-강의종료시간(분)
		
		AttendVO attend = new AttendVO();
		attend.setStdnt_no(stdnt_no);
		attend.setLec_code(lec_code);
		
		String view = null;
		if(ServiceResult.OK.equals(attendResult) && ServiceResult.OK.equals(exitResult)) {
			ServiceResult updateResult = ServiceResult.FAIL;
			if(ServiceResult.OK.equals(attendResult) && ServiceResult.OK.equals(exitResult)) {
				if(attend_check < 15 && attend_check > -15) {
					if(start_check< 15 && start_check > -15 && finish_check < 15 && finish_check > -15) {
						attend.setAttend_stat("CS");
						updateResult = studentService.updateAttendStat(attend);
						if(ServiceResult.OK.equals(updateResult)) {
							model.addAttribute("attend_time", attend_time);
							model.addAttribute("exit_time", exit_time);
							view = "lecture/qrResult";
						}else {
							model.addAttribute("attend_time", attend_time);
							model.addAttribute("exit_time", exit_time);
							view = "lecture/qrResult";
						}
					}
				}else {
					if((total_lec_time / 2) < attend_check) {
						attend.setAttend_stat("JG");
						updateResult = studentService.updateAttendStat(attend);
						if(ServiceResult.OK.equals(updateResult)) {
							model.addAttribute("attend_time", attend_time);
							model.addAttribute("exit_time", exit_time);
							view = "lecture/qrResult";
						}else {
							model.addAttribute("attend_time", attend_time);
							model.addAttribute("exit_time", exit_time);
							view = "lecture/qrResult";
						}
					}else if((total_lec_time / 2) > attend_check) {
						attend.setAttend_stat("GS");
						updateResult = studentService.updateAttendStat(attend);
						if(ServiceResult.OK.equals(updateResult)) {
							model.addAttribute("attend_time", attend_time);
							model.addAttribute("exit_time", exit_time);
							view = "lecture/qrResult";
						}else {
							model.addAttribute("attend_time", attend_time);
							model.addAttribute("exit_time", exit_time);
							view = "lecture/qrResult";
						}
					}
				}
			}
		}
		return view;
	}
}
