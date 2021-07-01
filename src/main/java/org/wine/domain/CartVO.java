package org.wine.domain;

import lombok.Data;

@Data
public class CartVO {

	private Long cartNum;
	private Long userNum;
	private String userRealName;
	private Long sellerNum;
	private String sellerId;
	private Long wineNum;
	private String wineTitle;
	private int winePrice;
	private int cartQty;
	private int totalPrice;
	
	private String wineImageName;
	
 
	
	
	
}
