package org.wine.mapper;

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
		
		seller.setSellerId("Keumyang International");
		seller.setSellerStoreName("금양인터내셔널");
		seller.setSellerContent("www.keumyang.com");
		seller.setSellerPhoneNum("02-2109-9200");
		seller.setSellerLocation("서울 영등포구 의사당대로8 (여의도동)");
				
		mapper.sellerInsert(seller);
		log.info(seller);
		
	}
		
	@Test 
	public void testSellerSelectKey() {
	  
		SellerVO seller = new SellerVO();
		  
		seller.setSellerId("GoriWineShop");
		seller.setSellerStoreName("고리 와인샵");
		seller.setSellerContent("고리와인샵 입니다.");
		seller.setSellerPhoneNum("031-287-1250");
		seller.setSellerLocation("경기 성남시 분당구 황새울로 234 (수내동)");
		  
		mapper.sellerSelectKey(seller); 
		log.info(seller); 
	  
	}
	
	@Test
	public void testRead() {
		
		SellerVO seller = mapper.read(25L);
		
		log.info(seller);
		
	}
	
	@Test
	public void testUpdate() {
		
		SellerVO seller = new SellerVO();
		
		seller.setSellerNum(25L);
		seller.setSellerPhoneNum("111111");
		seller.setSellerLocation("주소이전 업데이트");
		
		int count = mapper.update(seller);
		log.info("UPDATE COUNT : " + count);
	}
	
	@Test
	public void testDelete() {
		
		log.info("DELETE COUNT: " + mapper.delete(25L));
		
	}
	
	
	
	

}
