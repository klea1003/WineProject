package org.wine.sample;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.wine.domain.UserVO;
import org.wine.service.UserService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class UserServiceTest {
	@Setter(onMethod_ = { @Autowired })
	private UserService service;

	@Test
	public void testExist() {
		log.info(service);
		assertNotNull(service);
	}
	
	@Test
	public void testRegister() {
		UserVO user = new UserVO();
		user.setUSER_ID("yosepId2");
		user.setUSER_NICKNAME("yosepNickname2");
		user.setUSER_EMAIL("yosep@yosep.com2");
		user.setUSER_PASSWORD("yosepPWD2");
		user.setUSER_PHONENUM("010-1111-11112");
		user.setUSER_REALNAME("yosepReal2");
		user.setUSER_BIRTHDAY("2001-11-12");
		service.join(user);
		log.info(user);
	
	}
}