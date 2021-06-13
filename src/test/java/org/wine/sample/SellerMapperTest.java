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
	public void testInsert() {
		
		SellerVO seller = new SellerVO();
		
		seller.setSellerId("wineInsertTest111");
		seller.setSellerPhoneNum("11211");
		seller.setSellerLocation("소스트리 한글은 응답하라");
		
		mapper.insert(seller);
		log.info(seller);
		
	}
	
	
	
	

}
