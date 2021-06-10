package org.wine.domain;

import java.util.Date;

import lombok.Data;

@Data
public class BoardVO {
	
	private Long BOARD_NUM;
	private Long USER_NUM;
	private String BOARD_TYPE;
	private String BOARD_TITLE;
	private String BOARD_CONTENT;
	private Date REGDATE;
	private Long BOARD_READ_COUNT;

}
