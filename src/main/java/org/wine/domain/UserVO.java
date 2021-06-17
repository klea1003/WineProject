package org.wine.domain;


import lombok.Data;

@Data
public class UserVO {
	
	private Long userNum;
	private String userId;
	private String userNickName;
	private String userPassword;
	private String userRealName;
	private String userBirthDay;
	private String userEmail;
	private String userPhoneNum;

}
