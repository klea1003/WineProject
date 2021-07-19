package org.wine.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.wine.domain.OrderItemVO;
import org.wine.domain.OrderVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class OrderMapperTest {

	@Setter(onMethod_ = @Autowired)
	private OrderMapper mapper;
	
	@Test
	public void testGetNextOrderNum() throws Exception {
		log.info(mapper.getNextOrderNum());
	}
	
	@Test
	public void testInsertOrder() throws Exception {
		OrderVO orderVo = new OrderVO();
		
		orderVo.setOrderNum(4L);
		orderVo.setOrderName("123789NAM");
		orderVo.setUserNum(16L);
		
		orderVo.setPickUpName("test수령인");
		orderVo.setPickUpPhoneNum("010-1234-5678");
		orderVo.setPickUpDate("123");
		
		orderVo.setSellerNum(3L);
		
		mapper.insertOrder(orderVo);
		log.info(orderVo);
	}
	
	@Test
	public void testInsertOrderItem() throws Exception {
		OrderItemVO orderItemVo = new OrderItemVO();		
		
		orderItemVo.setOrderNum(4L);
		orderItemVo.setWineNum(15L);
		orderItemVo.setWineQty(3);
		
		mapper.insertOrderItem(orderItemVo);
		log.info(orderItemVo);
	}	
	
	@Test
	public void testGetOrderList() throws Exception {
		log.info(mapper.getOrderList(16L));
	}
	
	@Test
	public void getOrderItemList() throws Exception {
		mapper.getOrderItemList(4L).forEach(item -> log.info(item));
	}
	
	@Test
	public void testGetOrder() throws Exception {
		log.info(mapper.getOrder(4L));
	}
	
}
