package org.wine.domain;


import lombok.Data;

@Data
public class UserVO {
	
	private Long USER_NUM;
	private String USER_ID;
	private String USER_NICKNAME;
	private String USER_EMAIL;
	private String USER_PASSWORD;
	private String USER_PHONENUM;
	private String USER_REALNAME;
	private String USER_BIRTHDAY;

}
