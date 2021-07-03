package org.wine.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class OrderVO {
	
	private String orderNum;
	private Long userNum;
	private String pickUpName;
	private String pickUpPhoneNum;
	private int orderPrice;
	private Date orderDate;
	private String pickUpDate;
	

	
	
}