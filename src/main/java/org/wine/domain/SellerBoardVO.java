package org.wine.domain;

import java.util.Date;

import lombok.Data;

@Data
public class SellerBoardVO {
	
	private Long sellerBno;
	private String title;
	private String content;
	private String writer;
	private Date regdate;
	private Date UpdateDate;
}
