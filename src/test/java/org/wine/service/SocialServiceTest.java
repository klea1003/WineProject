package org.wine.service;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.wine.domain.SocialVO;
import org.wine.domain.UserVO;
import org.wine.service.UserService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class SocialServiceTest {
	@Setter(onMethod_ = { @Autowired })
	private SocialService service;

	@Test
	public void testExist() {
		log.info(service);
		assertNotNull(service);
	}
	
	@Test
	public void testFollowing() {
		SocialVO social = new SocialVO();
		social.setUserFollowingId(1L);
		social.setUserFollowerId("test");
		service.following(social);
		log.info(social);
	
	}
	
	@Test
	public void testunFollowing() {
		SocialVO social = new SocialVO();
		social.setUserFollowingId(1L);
		social.setUserFollowerId("test");
		service.unfollowing(social);
	
		//service.unfollowing("test","test");
		log.info(service);	
	}
	
	@Test
	public void testFollwinbtn() {
		service.followingBtn(1L);
		log.info(service);
	}
	
	@Test 
	public void testgetCountByFollower() {
		
	service.getCountByFollower(9L);
	}
	
	@Test 
	public void testgetCountByFollowing() {
		
	service.getCountByFollowing("yosep");
	}
}