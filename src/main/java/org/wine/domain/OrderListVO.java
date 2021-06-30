package org.wine.domain;

import java.util.Date;

import lombok.Data;

@Data
public class OrderListVO {

	private Long orderNum;
	private Long userNum;
	private String pickUpName;
	private String pickUpPhoneNum;
	private int orderPrice;
	private Date orderDate;
	private Date pickUpDate;
	
	private Long orderDetailNum;
	private String sellerId;
	private Long wineNum;
	private int cartQty;
	
	private String wineTitle;
	private String wineImageName;
	private int winePrice;
	

}
