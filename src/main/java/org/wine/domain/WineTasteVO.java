package org.wine.domain;

import lombok.Data;

@Data
public class WineTasteVO {
	
	private Long tasteNum;
	private Long wineNum;
	private String leftColumn;
	private String rightColumn;
	private Double ratio;

}
