package org.wine.service;

import java.util.List;

import org.wine.domain.SocialListVO;
import org.wine.domain.SocialVO;
import org.wine.domain.UserVO;

public interface SocialService {
		
		public int following(SocialVO social);
		
		public int unfollowing(SocialVO social);
		
		public SocialVO followingBtn(Long userFollowingId);
		
		public int getCountByFollower(Long userFollowingId);
		
		public int getCountByFollowing(Long userFollowerId);
		
		public List<SocialListVO> followingList(Long userFollowerId);
		
		public List<SocialListVO> followerList(Long userFollowingId);
}
