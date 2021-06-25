package org.wine.mapper;

import org.wine.domain.SocialVO;

public interface SocialMapper {
	
	public int following(SocialVO social);
	
	public int unfollowing(SocialVO social);
	//public int unfollowing(@Param("userFollowingId")String userFollowingId,@Param("userFollowerId")String userFollowerId);
	
	public SocialVO followingBtn(Long userFollowingId);
	
	public int getCountByFollower(Long userFollowingId);
	
	public int getCountByFollowing(String userFollowerId);
}
