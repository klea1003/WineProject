package org.wine.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.wine.domain.SocialVO;
import org.wine.domain.UserVO;
import org.wine.mapper.UserMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class SocialMapperTest {

	@Setter(onMethod_ = @Autowired)
	private SocialMapper mapper;

	@Test
	public void testFollowing() {
		SocialVO social = new SocialVO();
		social.setUserFollowingId(1L);
		social.setUserFollowerId("yosepId3");
		mapper.following(social);
	}
	
	@Test
	public void testunFollowing() {
		SocialVO social = new SocialVO();
		social.setUserFollowingId(1L);
		social.setUserFollowerId("yosepId3");
		mapper.unfollowing(social);
		//mapper.unfollowing("yosepId","test");
				
	}
	@Test 
	public void testgetCountByFollower() {
		
	mapper.getCountByFollower(9L);
	}
	
	@Test 
	public void testgetCountByFollowing() {
		
	mapper.getCountByFollowing("yosep");
	}
}
