package org.wine.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class WineReplyVO {
	private Long reviewNum;
	private Long userNum;
	private Long wno;
	private String review;
	private String reviewDate;
	private double reviewRating;
	private Long reviewLike;
	

}
