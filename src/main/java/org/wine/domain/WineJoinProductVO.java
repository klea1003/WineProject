package org.wine.domain;

import lombok.Data;

@Data
public class WineJoinProductVO {
	
	private Long wineNum;
    private String wineTitle; 
    private String winenery;
    private String wineGrapes;
    private String wineRegions;
    private String wineAllergens;
    private String wineType;
    private String wineRegion;
    private String wineCountry;
    private int winePrice;
    private Double wineAlcohol;
    private String wineStyle;
    private String imageName;
    
    private Long wineProductNum;
    private Long sellerNum;
    private String sellerId;
    private Long sellerPrice;
    private Long sellerWineQty;

}
