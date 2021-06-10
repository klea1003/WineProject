package org.wine.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ReplyVO {
	
	private Long REPLY_NUM;
	private Long REVIEW_NUM;
	private String REPLY_CONTENT;
	private Date REGDATE;
	
}
