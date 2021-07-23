package org.wine.service;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.wine.domain.SellerBoardVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class SellerBoardServiceTest {
	
	@Setter(onMethod_ = { @Autowired })
	private SellerBoardService service;
	
	@Test
	public void testExist() {
		
		log.info(service);
		assertNotNull(service);
		
	}

	@Test
	public void testRegister() {
		
		SellerBoardVO sellerBoard = new SellerBoardVO();
		sellerBoard.setTitle("10~15만원정도 선물용 와인추천 바랍니다");
		sellerBoard.setContent("10~15만원정도 선물용 와인추천 바랍니다");
		sellerBoard.setWriter("newuser12");
		
		service.register(sellerBoard);
		
		log.info("생성된 게시물의 번호 : " + sellerBoard.getParentSellerBno());
	}
	
	@Test
	public void testGetList() {
		
		service.getList().forEach(sellerBoard->log.info(sellerBoard));
		
	}
	
	@Test
	public void testGet() {
		
		log.info(service.get(2L,3L));
		
	}
	
	@Test
	public void testUpdate() {
		
		SellerBoardVO sellerBoard = service.get(1L,3L);
		
		if (sellerBoard == null) {
			return;
		}
		
		sellerBoard.setTitle("재문의 드립니다.");
		log.info("MODIFY RESULT : " + service.modify(sellerBoard));
		
	}
	
	@Test
	public void testDelete() {
		
		log.info("REMOVE RESULT : " + service.remove(4L));
		
	}
	
	@Test
	public void testAnswerBtn() {
		
		log.info("AnswerBtn RESULT : " + service.answerBtn(8L));
		
	}
	
	
	

}
