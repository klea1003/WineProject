package org.wine.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ReviewVO {
	
	private Long reviewNum;
	private Long userNum;
	private Long wineNum;
	private String userNickName;
	private String content;
	private String date;
	private String rating;
	private Float ratingF;
	private int cntLike;

}
