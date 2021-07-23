package org.wine.mapper;

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
public class SellerBoardMapperTest {
	
	@Setter(onMethod_ = @Autowired)
	private SellerBoardMapper mapper;
	
	@Test
	public void testGetList() {
		mapper.getList().forEach(seller->log.info(seller));
	}
	
	@Test
	public void testInsert() {
		
		SellerBoardVO sellerBoard = new SellerBoardVO();
		sellerBoard.setTitle(" [엔마트] 입점 문의 件");
		sellerBoard.setContent("입점문의는 어디서 문의드려야 하나요?");
		sellerBoard.setWriter("jenny1212");
		
		mapper.insert(sellerBoard);
		
		log.info(sellerBoard);
		
	}
	
	@Test
	public void testInsertSelectKey() {
		
		SellerBoardVO sellerBoard = new SellerBoardVO();
		sellerBoard.setTitle("결혼식 답례품 와인 문의");
		sellerBoard.setContent("최소 주문수량은 몇개인가요?");
		sellerBoard.setWriter("jbs1323");
		
		mapper.insertSelectKey(sellerBoard);
		
		log.info(sellerBoard);
		
	}
	
	@Test
	public void testRead() {
		
		SellerBoardVO sellerBoard = mapper.read(2L,3L);
		
		log.info(sellerBoard);
		
	}
	
	@Test
	public void testUpdate() {
		
		SellerBoardVO sellerBoard = new SellerBoardVO();
		
		sellerBoard.setParentSellerBno(2L);
		sellerBoard.setTitle("와인도매문의드립니다");
		sellerBoard.setContent("와인도매");
		sellerBoard.setWriter("user1212");
		
		int count = mapper.update(sellerBoard);
		log.info("UPDATE COUNT : " + count);
		
	}
	
	@Test
	public void testDelete() {
		
		log.info("DELETE COUNT : " + mapper.delete(3L));
	}


}
