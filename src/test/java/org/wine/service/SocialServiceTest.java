package org.wine.service;

import static org.junit.Assert.assertNotNull;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.wine.domain.SocialCriteriaReview;
import org.wine.domain.SocialReviewVO;
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
		social.setUserFollowerId(3L);
		service.following(social);
		log.info(social);
	
	}
	
	@Test
	public void testunFollowing() {
		SocialVO social = new SocialVO();
		social.setUserFollowingId(1L);
		social.setUserFollowerId(3L);
		service.unfollowing(social);
	
		//service.unfollowing("test","test");
		log.info(service);	
	}
	
	@Test
	public void testFollwinbtn() {
		service.followingBtn(1L, 2640L);
		log.info(service);
	}
	
	@Test 
	public void testgetCountByFollower() {
		
	service.getCountByFollower(3L);
	}
	
	@Test 
	public void testgetCountByFollowing() {
		
	service.getCountByFollowing(3L);
	}
	
	@Test 
	public void testFollowingList() {
		
	service.followingList(1L);
	}
	
	@Test 
	public void testMyReviewList() {
		
	service.myReviewList(1L);
	}

}