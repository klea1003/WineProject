package org.wine.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.wine.domain.ProfileVO;
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
	
	@Setter(onMethod_ = @Autowired)
	private UserAttachMapper attachmapper;

	@Test
	public void testGetList() {
		mapper.getList().forEach(user -> log.info(user));
	}

	@Test
	public void testJoin() {
		UserVO user = new UserVO();
		user.setUserId("yosepId5");
		user.setUserNickName("yosepNickname");
		user.setUserEmail("yosep@yosep.com");
		user.setUserPassword("yosepPWD");
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
		user.setUserPassword("yosepPWD2");
		user.setUserPhoneNum("010-1111-11112");
		user.setUserRealName("yosepReal2");
		user.setUserBirthDay("2001-11-11");
		mapper.joinSelectKey(user);
		log.info(user);

	}

	@Test
	public void testUpdate() {
		UserVO user = new UserVO();
		user.setUserNum(69L);
		user.setUserEmail("yosep@yosep.update");
		user.setUserPassword("yosepPWDupdate");
		user.setUserPhoneNum("010-2222-2222");
		user.setUserBirthDay("1999-11-11");
		int count = mapper.update(user);
		log.info("UPDATE COUNT : " + count);
	}

	@Test
	public void userIdChk() {
		String id = "admin";
		String id2 = "test123";
		mapper.idCheck(id);
		mapper.idCheck(id2);
	}

	@Test
	public void testuserLogin() {

		UserVO user = new UserVO(); // MemberVO 변수 선언 및 초기화

		/* 올바른 아이디 비번 입력경우 */
		// user.setUserId("admin");
		// user.setUserPassword("1234");

		/* 올바른 않은 아이디 비번 입력경우 */
		user.setUserId("admin");
		user.setUserPassword("1234111");

		mapper.userLogin(user);
		System.out.println("결과 값 : " + mapper.userLogin(user));

	}
	
	@Test
	public void testRead() {
		UserVO user = mapper.read(1L);
		log.info(user);
	}

	@Test
	public void testdelete() {
		attachmapper.deleteimage(6L);
		
	}
}
