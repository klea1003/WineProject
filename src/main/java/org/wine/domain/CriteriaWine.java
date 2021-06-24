package org.wine.domain;

import java.util.ArrayList;
import java.util.Arrays;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString

public class CriteriaWine {
	private int pageNum;
	private int amount;
	public CriteriaWine() {
		this(1,10);
	}
	public CriteriaWine(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
	private ArrayList<String> wineTypeArr;
}
