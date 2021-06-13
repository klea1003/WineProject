package org.wine.sample;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.wine.domain.SellerVO;
import org.wine.mapper.SellerMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class SellerMapperTest {
	
	@Setter(onMethod_ = @Autowired)
	private SellerMapper mapper;
	
	@Test
	public void testGetList() {
		mapper.getList().forEach(seller->log.info(seller));
	}
	
	@Test
	public void testSellerInsert() {
		
		SellerVO seller = new SellerVO();
		
		seller.setSellerId("wineInsertTest111");
		seller.setSellerPhoneNum("11211");
		seller.setSellerLocation("소스트리 한글은 응답하라");
		seller.setSellerLocation("변경");
		
		mapper.sellerInsert(seller);
		log.info(seller);
		
	}
		
	@Test 
	public void testSellerSelectKey() {
	  
		SellerVO seller = new SellerVO();
		  
		seller.setSellerId("요셉와인"); 
		seller.setSellerPhoneNum("010-1234");
		seller.setSellerLocation("경기도 수원시");
		  
		mapper.sellerSelectKey(seller); 
		log.info(seller); 
	  
	}
	
	@Test
	public void testRead() {
		
		SellerVO seller = mapper.read(10L);
		
		log.info(seller);
		
	}
	
	@Test
	public void testUpdate() {
		
		SellerVO seller = new SellerVO();
		
		seller.setSellerNum(8L);
		seller.setSellerPhoneNum("111111");
		seller.setSellerLocation("주소이전 업데이트");
		
		int count = mapper.update(seller);
		log.info("UPDATE COUNT : " + count);
	}
	
	@Test
	public void testDelete() {
		
		log.info("DELETE COUNT: " + mapper.delete(14L));
		
	}
	
	
	
	

}
