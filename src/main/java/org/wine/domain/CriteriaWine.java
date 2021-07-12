package org.wine.domain;

import java.util.ArrayList;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString

public class CriteriaWine {
	private int pageNum;
	private int amount;
	private ArrayList<String> wineTypeArr;
	private ArrayList<String> wineGrapeArr;
	private ArrayList<String> wineRegionArr;
	private ArrayList<String> wineCountryArr;
	private ArrayList<String> wineStyleArr;
	private double wineRatingMin;
	private double wineRatingMax;
	private int priceMin;
	private int priceMax;
	private String keyword;
	
	public CriteriaWine() {
		this(1,10);
	}
	public CriteriaWine(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
		this.wineTypeArr = new ArrayList<String>(); // null 이 되면 .size 에서 에러가 나므로 empty list 로 일단 만들어 놓음
		this.wineGrapeArr = new ArrayList<String>();
		this.wineRegionArr = new ArrayList<String>();
		this.wineCountryArr = new ArrayList<String>();
		this.wineStyleArr = new ArrayList<String>();
		this.wineRatingMin = 0.0;
		this.wineRatingMax = 5.0;
		this.priceMin = 1000;
		this.priceMax = 100000;
		this.keyword = null;
	}
	
	public void setWineTypeArr(ArrayList<String> wineTypeArr) {
		if (wineTypeArr == null) {
			this.wineTypeArr = new ArrayList<String>();
		} else {
			this.wineTypeArr = wineTypeArr;
		}
	}
	
	public void setWineGrapeArr(ArrayList<String>wineGrapeArr) {
		if(wineGrapeArr == null) {
			this.wineGrapeArr = new ArrayList<String>(); 
		}else {
			this.wineGrapeArr = wineGrapeArr; 
			
		}				
		
	}
	
	public void setWineRegionArr(ArrayList<String>wineRegionArr) {
		if(wineRegionArr == null) {
			this.wineRegionArr = new ArrayList<String>(); 			
		}else {
			this.wineRegionArr = wineRegionArr;
		}
		
	}
	
	public void setWineCountryArr(ArrayList<String>wineCountryArr) {
		if(wineCountryArr == null) {
			this.wineCountryArr = new ArrayList<String>(); 			
		}else {
			this.wineCountryArr = wineCountryArr;
		}
		
	}
	
	public void setWineStyleArr(ArrayList<String>wineStyleArr) {
		if(wineStyleArr == null) {
			this.wineStyleArr = new ArrayList<String>(); 			
		}else {
			this.wineStyleArr = wineStyleArr;
		}
		
	}
	public void setWineRating(int wineRating) {
		
		if(wineRating == 1) {
			this.wineRatingMin = 4.5;
			this.wineRatingMax = 5.0;
		} else if (wineRating == 2) {
			this.wineRatingMin = 4.0;
			this.wineRatingMax = 4.5;
		} else if (wineRating == 3 ) {
			this.wineRatingMin = 3.5;
			this.wineRatingMax = 4.0;
		} else if (wineRating == 4) {
			this.wineRatingMin = 3.0;
			this.wineRatingMax = 3.5;
		} else {
			this.wineRatingMin = 0.0;
			this.wineRatingMax = 5.0;
		}
	}
	
	public void setWinePriceRange(int priceMin, int priceMax) {
		this.priceMin = priceMin;
		this.priceMax = priceMax;		
	}
	
}
