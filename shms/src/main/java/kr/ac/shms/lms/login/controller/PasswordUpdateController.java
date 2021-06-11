package kr.ac.shms.lms.login.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.ac.shms.common.vo.StaffVO;
import kr.ac.shms.lms.login.vo.UserLoginVO;
import kr.ac.shms.lms.staff.service.LmsStaffService;
import kr.ac.shms.lms.student.service.StudentService;
import kr.ac.shms.lms.student.vo.StudentVO;

/**
 * @author 박초원
 * @since 2021. 6. 9.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                  수정자               수정내용
 * --------     --------    ----------------------
 * 2021. 6. 9.      박초원      	       최초작성
 * Copyright (c) 2021 by DDIT All right reserved
 * </pre>
 */
@Controller
public class PasswordUpdateController {
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	@Inject
	private StudentService studentService;
	@Inject
	private LmsStaffService lmsStaffService;
	@Inject
	private PasswordEncoder encoder;
	
	@RequestMapping("/lms/password.do")
	public String password() {
		return "/lms/password";
	}
	
	@RequestMapping("/lms/passwordUpdate.do")
	public String passwordUpdate() {
		// 학생
//		List<StudentVO> studentList = studentService.passwordUpdate();
//		for(StudentVO student : studentList) {
//			UserLoginVO login = new UserLoginVO();
//			if(student.getStdnt_no().equals(student.getAa())) {
//				login.setUser_id(student.getStdnt_no());
//				login.setUser_password(encoder.encode(student.getRegno1()));
//				studentService.passUpdate(login);
////				System.out.println("User : " + login.toString());
//			}
//		}
		// 교직원
		List<StaffVO> staffList = lmsStaffService.passwordUpdate();
		for(StaffVO staff : staffList) {
			UserLoginVO login = new UserLoginVO();
			if(staff.getStaff_no().equals(staff.getAa())) {
				login.setUser_id(staff.getStaff_no());
				login.setUser_password(encoder.encode(staff.getRegno1()));
				lmsStaffService.passUpdate(login);
//				System.out.println("User : " + login.toString());
			}
		}
		return "redirect:/lms/";
	}
}
