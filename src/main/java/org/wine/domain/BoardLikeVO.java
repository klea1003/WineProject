package org.wine.domain;

import lombok.Data;

@Data
public class BoardLikeVO {

	private Long WINElIKE_NUM;
	private Long BOARD_NUM;
	private Long USER_NUM;
	private String LIKES;
	
}
