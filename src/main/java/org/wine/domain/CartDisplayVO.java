package org.wine.domain;

import lombok.Data;

@Data
public class CartDisplayVO {

	// same as CartVO
	private Long cartNum;
	private Long userNum;
	private Long wineNum;
	private int wineQty;
	
	// different from CartVO
	private String title;
	private int price;
	private int totalPrice;
	private String imageName;
	
}
