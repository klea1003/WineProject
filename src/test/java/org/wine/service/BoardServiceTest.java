package org.wine.service;

import static org.junit.Assert.assertNotNull;

import org.wine.domain.BoardVO;
import org.wine.domain.Criteria;
import org.wine.service.BoardService;
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
public class BoardServiceTest {
	@Setter(onMethod_ = { @Autowired })
	private BoardService service;

	@Test
	public void testExist() {
		log.info(service);
		assertNotNull(service);
	}
	
	@Test
	public void testRegister() {
		BoardVO board = new BoardVO();
		board.setTitle("change from service");
		board.setContent("change from service");
		board.setType("Q&A");
		board.setWriter("newbie");
		service.register(board);
		log.info("REGISTER RESULT : " + board.getBoardNum());
	}
	
	@Test
	public void testGet() {
		log.info("GET RESULT "+service.get(86L).getTitle());
	}
	
	@Test
	public void testDelete() {
		log.info("REMOVE RESULT : " + service.remove(6L));
	}
	
	@Test
	public void testUpdate() {
		BoardVO board = service.get(7L);
		if(board==null) {return;}
		board.setTitle("change from Service");
		log.info("MODIFY RESULT : " + service.modify(board));
	}
	
	@Test
	public void testGetList() {
		service.getList(new Criteria(2,5)).forEach(board->log.info(board));
	}

}