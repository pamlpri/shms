package kr.ac.shms;

import static org.junit.Assert.*;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import kr.ac.shms.lms.login.vo.UserLoginVO;
import kr.ac.shms.lms.student.service.StudentService;
import kr.ac.shms.lms.student.vo.StudentVO;

@RunWith(SpringRunner.class)
@ContextConfiguration("file:webapp/WEB-INF/spring/*-context.xml")
@WebAppConfiguration
public class PasswordEncoderTest {
	private static final Logger logger = LoggerFactory.getLogger(PasswordEncoderTest.class);
	@Inject
	private PasswordEncoder encoder;
	@Inject
	private StudentService studentService;

	@Test
	public void test() {
//		String plain1 = "710210";
//		System.out.println("plain1" + encoder.encode(plain1));
//		String plain2 = "800505";
//		System.out.println("plain2" + encoder.encode(plain2));
//		String plain3 = "850111";
//		System.out.println("plain3" + encoder.encode(plain3));
		
//		String encoded = "{bcrypt}$2a$10$5Dwy8ZLe4s1iISXRiM374uY7ZLhIN7uGX6ecInYXY4UDrd9alb1va";
//		System.out.println(encoder.matches(plain, encoded));
		
		List<StudentVO> studentList = studentService.passwordUpdate();
		for(StudentVO student : studentList) {
			UserLoginVO login = new UserLoginVO();
			if(student.getStdnt_no().equals(student.getAa())) {
				login.setUser_id(student.getStdnt_no());
				login.setUser_password(encoder.encode(student.getRegno1()));
				studentService.passUpdate(login);
				System.out.println("User : " + login.toString());
			}
		}
	}

}
