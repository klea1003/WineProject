package org.wine.service;

import java.util.List;

import org.wine.domain.OrderDetailVO;
import org.wine.domain.OrderListVO;
import org.wine.domain.OrderVO;

public interface OrderService {

	public void orderInfo(OrderVO order) throws Exception;
	public void orderInfo_Detail(OrderDetailVO orderDetail) throws Exception;
	

	
	//주문 목록
	public List<OrderVO> orderList(OrderVO order)throws Exception;
	
	//특정 주문 상세 목록
	public List<OrderListVO> orderView(OrderVO order) throws Exception;

	//주문으로 넘어가면 카트 삭제
	public void cartAllDelete(Long userNum) throws Exception;
	
	

}
