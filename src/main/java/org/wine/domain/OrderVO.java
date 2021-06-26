package org.wine.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class OrderVO {
	
	private Long orderNum;
	private Long userNum;
	private String userRealName;
	private String pickUpName;
	private String pickUpPhoneNum;
	private int orderPrice;
	private Date orderDate;
	private String pickUpDate;

	
	
}