package org.wine.sample;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.wine.domain.UserVO;
import org.wine.mapper.UserMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class UserMapperTest {
	
	@Setter(onMethod_ = @Autowired)
	private UserMapper mapper;	
	
	@Test
	public void testGetList() {
		mapper.getList().forEach(user->log.info(user));
	}
	
	@Test
	public void testInsert() {
		UserVO user = new UserVO();
		user.setUSER_ID("yosepId");
		user.setUSER_NICKNAME("yosepNickname");
		user.setUSER_EMAIL("yosep@yosep.com");
		user.setUSER_PASSWORD("yosepPWD");
		user.setUSER_PHONENUM("010-1111-1111");
		user.setUSER_REALNAME("yosepReal");
		user.setUSER_BIRTHDAY("1995-11-15");
		mapper.join(user);
		log.info(user);
				
	}
	
	@Test
	public void testInsertSelectKey() {
		UserVO user = new UserVO();
		user.setUSER_ID("yosepId2");
		user.setUSER_NICKNAME("yosepNickname2");
		user.setUSER_EMAIL("yosep@yosep.com2");
		user.setUSER_PASSWORD("yosepPWD2");
		user.setUSER_PHONENUM("010-1111-11112");
		user.setUSER_REALNAME("yosepReal2");
		user.setUSER_BIRTHDAY("2001-11-11");
		mapper.joinSelectKey(user);
		log.info(user);
				
	}
	
	@Test
	public void testUpdate() {
		UserVO user = new UserVO();
		user.setUSER_NUM(28L);
		user.setUSER_EMAIL("yosep@yosep.update");
		user.setUSER_PASSWORD("yosepPWDupdate");
		user.setUSER_PHONENUM("010-2222-2222");
		user.setUSER_BIRTHDAY("1999-11-11");
		int count = mapper.update(user);
		log.info("UPDATE COUNT : " + count);
	}
}
