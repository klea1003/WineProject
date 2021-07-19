package org.wine.domain;

import lombok.Data;

@Data
public class SocialReviewVO {
	
	private Long reviewNum;
	private Long userNum;
	private Long wineNum;
	private String userRealName;
	private String reviewDate;
	private String reviewContent;
	private String wineImageName;
	private String wineTitle;
	private String reviewRating;
	private String userNickName;
	private  int ratingCnt;
}
