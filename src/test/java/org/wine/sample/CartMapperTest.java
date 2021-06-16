package org.wine.sample;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.wine.domain.CartVO;
import org.wine.mapper.CartMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class CartMapperTest {
	
@Setter(onMethod_=@Autowired)
private CartMapper mapper;

@Test
public void testGetList() {
	mapper.getList().forEach(cart -> log.info(cart));
}
	

@Test
public void testInsert() {
	CartVO cartvo = new CartVO();
	cartvo.setUserNum((long) 1);
	cartvo.setSellerNum((long) 21);
	cartvo.setWno((long) 4);
	cartvo.setCartQty(5);
	
	mapper.insert(cartvo);
	log.info(cartvo);
	
}
}
