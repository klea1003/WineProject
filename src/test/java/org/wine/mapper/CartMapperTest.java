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
	public void testGetList() {
		mapper.getList().forEach(cart->log.info(cart));
	}


	@Test
	public void testListCart() {
		mapper.listCart((long) 1).forEach(cart->log.info(cart));
	}

	
	@Test
	public void testInsert() {

		CartVO cartvo = new CartVO();

		cartvo.setUserNum((long) 7);
		cartvo.setSellerNum((long)31);
		cartvo.setWineNum((long)4);
		cartvo.setCartQty(5);

		mapper.insert(cartvo);
		log.info(cartvo);	
	}

	
	@Test
	public void testDelete() {
		log.info(mapper.delete(32L));	
	}

	
	@Test
	public void testModifyCart() {

		CartVO cartvo = new CartVO();

		cartvo.setUserNum((long)1);
		cartvo.setSellerNum((long)21);
		cartvo.setWineNum((long)4);
		cartvo.setCartQty(4);

		log.info(mapper.modifyCart(cartvo));
	}

	
	@Test
	public void testSumTotalPrice() {
		log.info(mapper.sumTotalPrice((long) 1));
	}


	@Test
	public void testCountCart() {
		CartVO cartvo = new CartVO();

		cartvo.setUserNum((long) 1);
		cartvo.setSellerNum((long)21);
		cartvo.setWineNum((long)4);

		log.info(mapper.countCart(cartvo));
	}


	@Test
	public void testUpdateCart() {
		CartVO cartvo = new CartVO();

		cartvo.setCartQty(6);
		cartvo.setUserNum((long)1);
		cartvo.setSellerNum((long)21);
		cartvo.setWineNum((long)4);

		log.info(mapper.updateCart(cartvo));
	}
}
