package org.wine.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString

public class CriteriaReview {
	private int pageNum;
	private int amount;
	private int wineNum;
	public CriteriaReview() {
		this(1,10);
	}
	public CriteriaReview(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
	
}
