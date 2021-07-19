package org.wine.mapper;
import java.util.List;

import org.wine.domain.OrderItemVO;
import org.wine.domain.OrderVO;


public interface OrderMapper {
	
	public Long getNextOrderNum();
	
	public void insertOrder(OrderVO orderVo);
	
	public void insertOrderItem(OrderItemVO orderItemVo);	
	
	public List<OrderVO> getOrderList(Long userNum) throws Exception;
	
	public List<OrderItemVO> getOrderItemList(Long orderNum) throws Exception;
	
	public OrderVO getOrder(Long orderNum) throws Exception;

}
