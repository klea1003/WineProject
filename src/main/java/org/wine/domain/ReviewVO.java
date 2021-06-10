package org.wine.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ReviewVO {
	
	private Long REVIEW_NUM;
	private Long WINE_NUM;
	private Long USER_NUM;
	private String REVIEW_CONTENT;
	private Date REGDATE;
	private String STAR_RATING;

}
