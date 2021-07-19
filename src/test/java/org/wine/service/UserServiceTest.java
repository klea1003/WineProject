package org.wine.service;

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
		user.setUserId("yosepId2");
		user.setUserNickName("yosepNickname2");
		user.setUserEmail("yosep@yosep.com2");
		user.setUserPassword("yosepPWD2");
		user.setUserPhoneNum("010-1111-11112");
		user.setUserRealName("yosepReal2");
		user.setUserBirthDay("2001-11-12");
		service.join(user);
		log.info(user);
	
	}
	
	@Test
	public void getWishList() {
		service.getwishList(1L);
	}
}