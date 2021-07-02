package org.wine.domain;

import lombok.Data;

@Data
public class BoardLikeVO {

	private Long likeNum;
	private Long boardNum;
	private String userID;
	private int likeStack;
	
}
