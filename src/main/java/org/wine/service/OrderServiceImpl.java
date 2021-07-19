package org.wine.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.wine.domain.OrderItemVO;
import org.wine.domain.OrderVO;
import org.wine.mapper.OrderMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;


@Log4j
@Service
public class OrderServiceImpl implements OrderService {

	@Setter(onMethod_ = @Autowired)
	private OrderMapper mapper;
	
	@Override
	public Long getNextOrderNum() throws Exception {
		return mapper.getNextOrderNum();
	}

	@Override
	public void insertOrder(OrderVO order) throws Exception{
		mapper.insertOrder(order);
	}
	
	@Override
	public void insertOrderItem(OrderItemVO orderItemVo) throws Exception {
		mapper.insertOrderItem(orderItemVo);
	}
	
	@Override
	public List<OrderVO> getOrderList(Long userNum) throws Exception{
		return mapper.getOrderList(userNum);
	}
	
	@Override
	public List<OrderItemVO> getOrderItemList(Long orderNum)throws Exception{
	return mapper.getOrderItemList(orderNum);
	}
	
	@Override
	public OrderVO getOrder(Long orderNum) throws Exception{
		return mapper.getOrder(orderNum);
	}

}