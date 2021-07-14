package org.wine.domain;


import java.util.List;

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
	private String userAddress1;
	private String userAddress2;
	private String userAddress3;
	
	
	private List<ProfileVO> profileList;
}
