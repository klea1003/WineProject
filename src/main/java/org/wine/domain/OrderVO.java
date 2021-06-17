package org.wine.domain;

import java.util.Date;

import lombok.Data;

@Data
public class OrderVO {
	
	private Long orderNum;
	private Long userNum;
	private String userRealName;
	private String pickUpName;
	private String pickUpPhonNum;
	private int orderPrice;
	private Date orderDate;
	private Date pickUpDate;

	
	
}