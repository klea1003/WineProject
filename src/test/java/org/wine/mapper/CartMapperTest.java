package org.wine.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.wine.domain.CartVO;
import org.wine.domain.SellerVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class CartMapperTest {

	@Setter(onMethod_ = @Autowired)
	private CartMapper mapper;
	
	@Test
	public void testInsert() {

		CartVO cartVo = new CartVO();
		
		cartVo.setUserNum(12L);
		cartVo.setWineNum(16L);
		cartVo.setWineQty(2);

		mapper.insert(cartVo);
		log.info(cartVo);
		
	}
	
	@Test
	public void testGetCount() {		
		log.info(mapper.getCount(16L, 2L));
	}
	
	@Test
	public void testUpdateWineQty() {

		CartVO cartVo = new CartVO();
		
		cartVo.setUserNum(16L);
		cartVo.setWineNum(2L);
		cartVo.setWineQty(4);

		log.info(mapper.updateWineQty(cartVo));
	}
	
	@Test
	public void testDelete() {
		log.info(mapper.delete(282L));	
	}
	
	@Test
	public void testDeleteByUserAndWine() {
		log.info(mapper.deleteByUserAndWine(16L, 2L));
	}

	@Test
	public void testGetList() {
		mapper.getList(16L).forEach(cartDisInfo->log.info(cartDisInfo));
	}
	
	@Test
	public void testgetTotalPrice() {
		log.info(mapper.getTotalPrice(16L));
	}

	@Test
	public void testCountWine() {
		log.info(mapper.countWine(16L, 2L));
	}

}
