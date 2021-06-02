package kr.ac.shms.lms.login.service.impl;

import static org.junit.Assert.fail;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.context.web.WebAppConfiguration;

@RunWith(SpringRunner.class)
@WebAppConfiguration
@ContextConfiguration("file:webapp/WEB-INF/spring/*-context.xml")
public class LoginServiceImplTest {
	@Inject
	private PasswordEncoder encoder;
	
	@Test
	public void testAuthenticate() {
		String plain = "java";
		String encoded = encoder.encode(plain);
		System.out.println(encoded);
		//{bcrypt}$2a$10$SsBdI5OVCBes1uY/lO3bFugMqqlZO/MJxHqO0i01FzGA/wpeT5Tcy
		boolean match = encoder.matches(plain, encoded);
		System.out.println(match);
	}

}
