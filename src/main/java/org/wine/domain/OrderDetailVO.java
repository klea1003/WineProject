package org.wine.domain;

import lombok.Data;

@Data
public class OrderDetailVO {
	
	private Long orderDetailNum;
	private String orderNum;
	private Long sellerNum;
	private Long wineNum;
	private int cartQty;
	

}
