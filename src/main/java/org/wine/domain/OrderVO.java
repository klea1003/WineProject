package org.wine.domain;

import java.util.Date;

import lombok.Data;

@Data
public class OrderVO {
	
	private Long ORDER_NUM;
	private Long USER_NUM;
	private String USER_REALNAME;
	private String PICKUP_NAME;
	private Date ORDER_DATE;
	private Date PICKUP_DATE;
	private String PICKUP_PHONENUM;

}
