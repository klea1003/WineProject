package org.wine.domain;

import lombok.Data;

@Data
public class OrderDetailVO {
	
	private Long orderDetailNum;
	private Long orderNum;
	private String sellerId;
	private Long wineNum;
	private int cartQty;
	

}
