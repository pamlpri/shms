package kr.ac.shms;

import static org.junit.Assert.*;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.context.web.WebAppConfiguration;

@RunWith(SpringRunner.class)
@ContextConfiguration("file:webapp/WEB-INF/spring/*-context.xml")
@WebAppConfiguration
public class PasswordEncoderTest {
	
	@Inject
	private PasswordEncoder encoder;
	

	@Test
	public void test() {
		String plain1 = "710210";
		System.out.println("plain1" + encoder.encode(plain1));
		String plain2 = "800505";
		System.out.println("plain2" + encoder.encode(plain2));
		String plain3 = "850111";
		System.out.println("plain3" + encoder.encode(plain3));
		
		
//		String encoded = "{bcrypt}$2a$10$5Dwy8ZLe4s1iISXRiM374uY7ZLhIN7uGX6ecInYXY4UDrd9alb1va";
//		System.out.println(encoder.matches(plain, encoded));
	}

}
