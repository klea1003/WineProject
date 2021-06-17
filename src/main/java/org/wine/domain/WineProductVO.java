package org.wine.domain;

import lombok.Data;

@Data
public class WineProductVO {
	
	private Long wineProductNum;
	private String sellerId;
	private Long wineNum;
	private Long winePrice;
	private Long wineQty;

}
