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
		String plain = "710302";
		System.out.println(encoder.encode(plain));
		
//		String encoded = "{bcrypt}$2a$10$5Dwy8ZLe4s1iISXRiM374uY7ZLhIN7uGX6ecInYXY4UDrd9alb1va";
//		System.out.println(encoder.matches(plain, encoded));
	}

}
