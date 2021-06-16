package org.wine.domain;

import lombok.Data;

@Data
public class CartVO {

	private Long cartNum;
	private Long userNum;
	private String userRealName;
	private Long sellerNum;
	private String sellerId;
	private Long wno;
	private String title;
	private int price;
	private int cartQty;
	private int totalPrice;
	
 
	
	
	
}
