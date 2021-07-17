package org.wine.service;

import java.util.List;

import org.wine.domain.SocialCriteriaReview;
import org.wine.domain.SocialListVO;
import org.wine.domain.SocialPageDTO;
import org.wine.domain.SocialReviewVO;
import org.wine.domain.SocialVO;


public interface SocialService {
		
		public int following(SocialVO social);
		
		public int unfollowing(SocialVO social);
		
		public SocialVO followingBtn( Long userFollowingId,Long userFollowerId);
		
		public int getCountByFollower(Long userFollowingId);
		
		public int getCountByFollowing(Long userFollowerId);
		
		public List<SocialListVO> followingList(Long userFollowerId);
		
		public List<SocialListVO> followerList(Long userFollowingId);
		
		public List<SocialReviewVO> followingReviewList(SocialCriteriaReview crire, Long userFollowingId);
		
		public SocialPageDTO followingReviewListPaging(SocialCriteriaReview crire,Long userNum);

		public int getCountByuserNum(Long userNum);
		
		public int getCountByUserNumRating(Long userNum);
		
		public List<SocialReviewVO> myReviewList(Long userNum);
}
