package org.wine.service;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.log;

import java.util.ArrayList;
import java.util.Arrays;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.wine.domain.CartVO;
import org.wine.domain.CriteriaWine;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class CartServiceTests {
	
	@Setter(onMethod_ = @Autowired)
	private CartService service;
	
	@Test
	public void testExist() {
		
		log.info(service);
		assertNotNull(service);
	}
	
	@Test
	public void testRegister1() {
		
		Long userNum = 12L;
		Long wineNum = 16L;
		
		service.deleteCartByUserAndWine(userNum, wineNum);		
		
		CartVO cartVo = new CartVO();	
		
		cartVo.setUserNum(userNum);
		cartVo.setWineNum(wineNum);
		cartVo.setWineQty(2);
		
		service.addWine(cartVo);
		
		int wineQty = service.getWineQty(userNum, wineNum);
		
		assertEquals(wineQty, 2);
		
		log.info("Wine Qty:" + wineQty);
		
	}
	
	@Test
	public void testRegister2() {
		
		Long userNum = 12L;
		Long wineNum = 16L;
		
		service.deleteCartByUserAndWine(userNum, wineNum);	
		
		CartVO cartVo = new CartVO();	
		
		cartVo.setUserNum(userNum);
		cartVo.setWineNum(wineNum);
		cartVo.setWineQty(2);
		
		// first add wine
		service.addWine(cartVo);
		
		int wineQty = service.getWineQty(userNum, wineNum);
		
		assertEquals(wineQty, 2);
		
		// second add wine
		service.addWine(cartVo);
		
		wineQty = service.getWineQty(userNum, wineNum);
		
		assertEquals(wineQty, 4);
		
	}
	
	@Test
	public void testGetList() {
		log.info(service.getList(12L));	
	}
	
	@Test
	public void testGetTotalPrice() {
		log.info(service.getTotalPrice(16L));
	}

}
