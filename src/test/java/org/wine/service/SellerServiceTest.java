package org.wine.sample;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.wine.domain.SellerVO;
import org.wine.service.SellerService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class SellerServiceTest {
	
	@Setter(onMethod_ = { @Autowired })
	private SellerService service;
	
	@Test
	public void testExist() {
		
		log.info(service);
		assertNotNull(service);
		
	}
	
	@Test
	public void testRegister() {
		
		SellerVO seller = new SellerVO();
		seller.setSellerId("seller 서비스단");
		seller.setSellerStoreName("seller 서비스단 와인");
		seller.setSellerContent("서비스단 와인입니다");
		seller.setSellerPhoneNum("010-1234-1234");
		seller.setSellerLocation("수원시");
		
		service.register(seller);
		
		log.info("생성된 셀러의 번호 : " + seller.getSellerNum());
		
	}
	
	@Test
	public void testGetList() {
		
		service.getList().forEach(seller->log.info(seller));
		
	}
	
	@Test
	public void testGet(){
		
		log.info(service.get(28L));
		
	}
	
	@Test
	public void testUpdate() {
		
		SellerVO seller = service.get(28L);
		
		if(seller == null) {
			return;
		}
		
		seller.setSellerPhoneNum("전화번호를 수정합니다.");
		log.info("MODIFY RESULT : " + service.modify(seller));
		
	}
	
	@Test
	public void testDelete() {
		
		log.info("REMOVE RESULT : " + service.remove(28L));
		
	}
	

}
