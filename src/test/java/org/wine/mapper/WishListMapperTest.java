package org.wine.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.wine.domain.WishListVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class WishListMapperTest {

	@Setter(onMethod_ = @Autowired)
	private WishListMapper mapper;

	
	@Test
	public void testListWish() {
		mapper.getList((long)1).forEach(wish->log.info(wish));
	}

	
	@Test
	public void testInsert() {
		WishListVO wishList = new WishListVO();
		
		wishList.setUserNum((long)1);
		wishList.setWineNum((long)8);
		
		mapper.insert(wishList);
		log.info(wishList);	
	}

	
	@Test
	public void testDelete() {
		log.info(mapper.delete(1L));
	}
}