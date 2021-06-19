package org.wine.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.wine.domain.OrderDetailVO;
import org.wine.domain.OrderListVO;
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
	public void orderInfo(OrderVO order) throws Exception{
		mapper.orderInfo(order);
	}
	
	@Override
	public void orderInfo_Detail(OrderDetailVO orderDetail) throws Exception{
		mapper.orderInfo_Detail(orderDetail);
	}
	
	@Override
	public void cartAllDelete(Long userNum)throws Exception{
		mapper.cartAllDelete(userNum);
	}
	
	@Override
	public List<OrderVO> orderList(OrderVO order)throws Exception{
	return mapper.orderList(order);
	}
	
	@Override
	public List<OrderListVO> orderView(OrderVO order)throws Exception{
		return mapper.orderView(order);
	}

}