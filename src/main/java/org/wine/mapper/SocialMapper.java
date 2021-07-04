package org.wine.mapper;

import java.util.List;

import org.wine.domain.SocialListVO;
import org.wine.domain.SocialVO;
import org.wine.domain.UserVO;

public interface SocialMapper {
	
	public int following(SocialVO social);
	
	public int unfollowing(SocialVO social);
	//public int unfollowing(@Param("userFollowingId")String userFollowingId,@Param("userFollowerId")String userFollowerId);
	
	public SocialVO followingBtn(Long userFollowingId);
	
	public int getCountByFollower(Long userFollowingId);
	
	public int getCountByFollowing(Long userFollowerId);
	
	public List<SocialListVO> followingList(Long userFollowergId);
	
	public List<SocialListVO> followerList(Long userFollowingId);
}
