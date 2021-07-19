package org.wine.domain;

import lombok.Data;

@Data
public class OrderVO {
	
	private Long orderNum;
	private String orderName;
	private Long userNum;	
	private String pickUpName;
	private String pickUpPhoneNum;
	private String pickUpDate;	
	private String orderDate;
	private int totalPrice;	
	private Long sellerNum;
	private String storeName;
	
	private String orderComment;
	private Long paymentNum;
	private String paymentTitle;
	
}