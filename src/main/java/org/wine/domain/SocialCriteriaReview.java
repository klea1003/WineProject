package org.wine.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString

public class SocialCriteriaReview {
	private int pageNum;
	private int amount;

	public SocialCriteriaReview() {
		this(1,10);
	}
	public SocialCriteriaReview(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	
	}
	
	
}
