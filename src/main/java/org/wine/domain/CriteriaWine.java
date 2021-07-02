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
	private int winePrice;
	private ArrayList<String> wineTypeArr;
	private ArrayList<String> wineGrapeArr;
	private ArrayList<String> wineRegionArr;
	private ArrayList<String> wineCountryArr;
	private ArrayList<String> wineStyleArr;
	private ArrayList<String> wineRatingArr;
	public CriteriaWine() {
		this(1,10);
	}
	public CriteriaWine(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
		this.winePrice = winePrice;
		this.wineTypeArr = new ArrayList<String>(); // null 이 되면 .size 에서 에러가 나므로 empty list 로 일단 만들어 놓음
		this.wineGrapeArr = new ArrayList<String>();
		this.wineRegionArr = new ArrayList<String>();
		this.wineCountryArr = new ArrayList<String>();
		this.wineStyleArr = new ArrayList<String>();
		this.wineRatingArr = new ArrayList<String>();
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
	public void setWineRatingArr(ArrayList<String>wineRatingArr) {
		if(wineRatingArr == null) {
			this.wineRatingArr = new ArrayList<String>(); 			
		}else {
			this.wineRatingArr = wineRatingArr;
		}
		
	}
	
}
