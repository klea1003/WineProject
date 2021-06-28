package org.wine.mapper;

import java.util.List;

import org.wine.domain.BoardLikeVO;
import org.wine.domain.BoardVO;
import org.wine.domain.Criteria;


import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j

public class BoardLikeMapperTest {
 @Setter(onMethod =@__({@Autowired}))
 private BoardLikeMapper mapper;

	
	/*
	 * @Test public void testinsert() { BoardLikeVO like = new BoardLikeVO();
	 * like.setBoardNum(1L); like.setUserID("user006"); mapper.insert(like); }
	 */
	 

@Test
public void testread() {
	 BoardLikeVO like = new BoardLikeVO();
	 like.setUserID("user000");
	 like.setLikeNum(1L);
	 mapper.read(like);
}

@Test
public void testUpdate() {
	 BoardLikeVO like = new BoardLikeVO();
	 like.setUserID("user000");
	 like.setLikeNum(1L);
	mapper.update(like);
}
@Test
public void testUpdateD() {
	 BoardLikeVO like = new BoardLikeVO();
	 like.setUserID("user000");
	 like.setLikeNum(1L);
	mapper.updateD(like);
}
@Test
public void testgettotal() {
	mapper.getTotalLike(1L);
}


}