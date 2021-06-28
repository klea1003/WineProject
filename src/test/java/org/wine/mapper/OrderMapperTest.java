package org.wine.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.wine.domain.OrderListVO;
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
	public void testOrderInfo() throws Exception {
		OrderVO order = new OrderVO();
		
		order.setOrderNum((long) 4);
		order.setUserNum((long) 9);
		order.setUserRealName("hytest");
		order.setPickUpName("test수령인");
		order.setOrderPrice(150000);
		order.setPickUpPhoneNum("010-1234-5678");
	//	order.setPickUpDate('');
		
		mapper.orderInfo(order);
		log.info(order);
	
	
	}
	
	@Test
	public void testOrderList() throws Exception {
		OrderVO order = new OrderVO();
		
		order.setUserNum((long) 1);
		log.info(mapper.orderList(order));
	}
	
	@Test
	public void testOrderView() throws Exception{
		OrderListVO orderList = new OrderListVO();
		
		orderList.setUserNum((long) 1);
		orderList.setOrderNum((long) 1);
		log.info(orderList);
	
	}
	

}
