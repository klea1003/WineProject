package org.wine.domain;

import java.util.Date;

import lombok.Data;

@Data
public class SellerBoardVO {
	
	private Long rn;
	private Long parentSellerBno;
	private Long childSellerBno;
	private Long groupOrder;
	private String title;
	private String content;
	private String writer;
	private Date regdate;
	
}
