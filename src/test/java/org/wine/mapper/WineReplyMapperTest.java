package org.wine.mapper;

import java.util.List;
import org.wine.domain.WineReplyVO;

import org.wine.mapper.WineReplyMapper;
import org.wine.domain.Criteria;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import lombok.Setter;
import lombok.extern.log4j.Log4j;


@WebAppConfiguration 
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j

public class WineReplyMapperTest {
	@Setter(onMethod = @__({ @Autowired }))
	private WineReplyMapper mapper;

	/*
	 * @Test public void testinsert() { WineReplyVO like = new WineReplyVO();
	 * like.setWno(1L); like.setUserNum(1L); like.setReview("so cool!!!!!!!! ");
	 * like.setReviewRating(4.5); mapper.insert(like); log.info(like); }
	 */

	@Test
	public void testread() {
		log.info(mapper.read(1L));
	}
	@Test
	public void testgetList5() {
		log.info(mapper.getList5(1L));
	}
	@Test
	public void testgetListAll() {
		log.info(mapper.getListAll(1L));
	}

	@Test
	public void testUpdate() {
		WineReplyVO like = new WineReplyVO();
		like.setWno(1L);
		like.setUserNum(1L);
		like.setReview("so cool!!!!!!!! ");
		like.setReviewRating(4.5);
		mapper.insert(like);
		log.info(like);
	}
	
	@Test
	public void testUpLike() {
		WineReplyVO like = new WineReplyVO();
		like.setUserNum(1L);
		like.setReviewNum(1L);
		log.info("your like is " + mapper.checkLike(like));
	}

	@Test
	public void testupLike() {
		WineReplyVO like = new WineReplyVO();
		like.setReviewNum(1L);
		mapper.upLike(like);
	}

	@Test
	public void testgettotal() {
		log.info(mapper.getTotalCount(1L));
	}
	
	@Test
	public void testgetTotalStar() {
		log.info(mapper.getTotalStar(1L));
	}
	
	@Test
	public void testgetFromStar() {
		WineReplyVO like = new WineReplyVO();
		like.setWno(1L);
		like.setReviewRating(4.5);
		log.info(mapper.getFromStar(like));
	}

}
