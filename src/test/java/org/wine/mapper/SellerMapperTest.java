package org.wine.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.wine.domain.SellerVO;


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
	public void testgetImageList() {
	  mapper.getImageList(2L);
	}
	
	@Test
	public void testRead() {
		
		SellerVO seller = mapper.read(3L);
		
		log.info(seller);
		
	}
	
	@Test
	public void testUpdate() {
		
		SellerVO seller = new SellerVO();
		
		seller.setSellerNum(6L);
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
