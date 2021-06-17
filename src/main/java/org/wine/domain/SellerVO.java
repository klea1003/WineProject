package org.wine.domain;

import lombok.Data;

@Data
public class SellerVO {
	
	private Long sellerNum;
	private String sellerId;
	private String sellerStoreName;
	private String sellerContent;
	private String sellerPhoneNum;
	private String sellerLocation;

}
