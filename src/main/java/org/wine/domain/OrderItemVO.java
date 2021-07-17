package org.wine.domain;

import java.util.Date;

import lombok.Data;

@Data
public class OrderItemVO {

	private Long orderItemNum;
	private Long orderNum;
	
	private Long wineNum;
	private int wineQty;
	
	private String title;
	private int price;	
	private String imageName;
	
	private int totalPrice;
}
