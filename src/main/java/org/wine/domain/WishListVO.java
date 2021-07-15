package org.wine.domain;

import lombok.Data;

@Data
public class WishListVO {
	
	private Long wishNum;
	private Long userNum;
	private Long wineNum;
	
	private String wineTitle;
	private String wineImageName;
	private int winePrice;
	
}
