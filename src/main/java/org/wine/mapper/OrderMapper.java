package org.wine.mapper;
import java.util.List;

import org.wine.domain.OrderDetailVO;
import org.wine.domain.OrderListVO;
import org.wine.domain.OrderVO;


public interface OrderMapper {
	
//주문 정보
public void orderInfo(OrderVO order) throws Exception;

//주문 상세 정보
public void orderInfo_Detail(OrderDetailVO orderDetail) throws Exception;

//주문완료 후 카트에서 삭제
public void cartAllDelete(Long userNum) throws Exception;

//주문 목록
public List<OrderVO> orderList(OrderVO order) throws Exception;

//특정 주문 상세 목록
public List<OrderListVO> orderView(OrderVO order) throws Exception;

}
