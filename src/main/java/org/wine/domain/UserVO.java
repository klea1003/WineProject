package org.wine.domain;


import lombok.Data;

@Data
public class UserVO {
	
	private Long userNum;
	private String userId;
	private String userNickName;
	private String userEmail;
	private String userPassWord;
	private String userPhoneNum;
	private String userRealName;
	private String userBirthDay;

}
