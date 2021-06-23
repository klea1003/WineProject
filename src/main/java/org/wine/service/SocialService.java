package org.wine.service;

import org.wine.domain.SocialVO;

public interface SocialService {
		
		public int following(SocialVO social);
		
		public int unfollowing(SocialVO social);
		
		public SocialVO followingBtn(Long userFollowingId);
		
		public int getCountByFollower(Long userFollowingId);
		
		public int getCountByFollowing(String userFollowerId);
}
