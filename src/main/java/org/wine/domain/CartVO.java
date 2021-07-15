package org.wine.domain;

import lombok.Data;

@Data
public class CartVO {

	private Long cartNum;
	private Long userNum;
	private Long wineNum;
	private int wineQty;
}
