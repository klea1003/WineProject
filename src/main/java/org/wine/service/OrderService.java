package org.wine.service;

import java.util.List;

import org.wine.domain.OrderItemVO;
import org.wine.domain.OrderVO;

public interface OrderService {
	
	public Long getNextOrderNum() throws Exception;

	public void insertOrder(OrderVO order) throws Exception;
	
	public void insertOrderItem(OrderItemVO orderItemVo) throws Exception;
	
	public List<OrderVO> getOrderList(Long userNum) throws Exception;
	
	public List<OrderItemVO> getOrderItemList(Long orderNum) throws Exception;
	
	public OrderVO getOrder(Long orderNum) throws Exception;
	

}
