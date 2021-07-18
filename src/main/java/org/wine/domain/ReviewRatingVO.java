package org.wine.domain;

import lombok.Data;

@Data
public class ReviewRatingVO {
	
	private long rating1;
	private long rating2;
	private long rating3;
	private long rating4;
    private long rating5;   
    
    public ReviewRatingVO() {
		this(0, 0, 0, 0, 0);
	}
    
	public ReviewRatingVO(int rating1, int rating2, int rating3, int rating4, int rating5) {
		this.rating1 = rating1;
		this.rating2 = rating2;
		this.rating3 = rating3;
		this.rating4 = rating4;
		this.rating5 = rating5;
	} 
}




