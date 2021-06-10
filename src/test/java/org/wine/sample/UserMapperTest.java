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
	public void testJoin() {
		UserVO user = new UserVO();
		user.setUserId("yosepId");
		user.setUserNickName("yosepNickname");
		user.setUserEmail("yosep@yosep.com");
		user.setUserPassWord("yosepPWD");
		user.setUserPhoneNum("010-1111-1111");
		user.setUserRealName("yosepReal");
		user.setUserBirthDay("1995-11-15");
		mapper.join(user);
		log.info(user);
				
	}
	
	@Test
	public void testJoinSelectKey() {
		UserVO user = new UserVO();
		user.setUserId("yosepId2");
		user.setUserNickName("yosepNickname2");
		user.setUserEmail("yosep@yosep.com2");
		user.setUserPassWord("yosepPWD2");
		user.setUserPhoneNum("010-1111-11112");
		user.setUserRealName("yosepReal2");
		user.setUserBirthDay("2001-11-11");
		mapper.joinSelectKey(user);
		log.info(user);
				
	}
	
	@Test
	public void testUpdate() {
		UserVO user = new UserVO();
		user.setUserNum(28L);
		user.setUserEmail("yosep@yosep.update");
		user.setUserPassWord("yosepPWDupdate");
		user.setUserPhoneNum("010-2222-2222");
		user.setUserBirthDay("1999-11-11");
		int count = mapper.update(user);
		log.info("UPDATE COUNT : " + count);
	}
}
