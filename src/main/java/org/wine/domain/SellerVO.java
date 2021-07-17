package org.wine.domain;

import lombok.Data;

@Data
public class SellerVO {
	
	private Long sellerNum;
	private String sellerId;
	private String sellerStoreName;
	private String sellerPhoneNum;
	private String sellerLocation;
	private String sellerBusinessHour;
	private String sellerManger;
	private String sellerMagEmail;
	private String sellerContent;

}
