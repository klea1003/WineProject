package org.wine.domain;

import lombok.Data;

@Data
public class SocialVO {
	
	private Long userFollowingId;
	private String userFollowerId;
	
	private int followingCnt;
	private int followerCnt;
}
