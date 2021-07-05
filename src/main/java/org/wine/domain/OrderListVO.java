package org.wine.domain;

import java.util.Date;

import lombok.Data;

@Data
public class OrderListVO {

	private String orderNum;
	private Long userNum;
	private String pickUpName;
	private String pickUpPhoneNum;
	private int totalPrice;
	private Date orderDate;
	private String pickUpDate;
	
	private Long orderDetailNum;
	private Long sellerNum;
	private Long wineNum;
	private int cartQty;
	
	private String wineTitle;
	private String wineImageName;
	private int winePrice;
	

}
