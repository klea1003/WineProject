package org.wine.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.wine.domain.CriteriaReview;
import org.wine.domain.SocialCriteriaReview;
import org.wine.domain.SocialListVO;
import org.wine.domain.SocialReviewVO;
import org.wine.domain.SocialVO;

public interface SocialMapper {
	
	public int following(SocialVO social);
	
	public int unfollowing(SocialVO social);
	//public int unfollowing(@Param("userFollowingId")String userFollowingId,@Param("userFollowerId")String userFollowerId);
	
	public SocialVO followingBtn(@Param("userFollowingId")Long userFollowingId,@Param("userFollowerId")Long userFollowerId);
	
	public int getCountByFollower(Long userFollowingId);
	
	public int getCountByFollowing(Long userFollowerId);
	
	public List<SocialListVO> followingList(Long userFollowergId);
	
	public List<SocialListVO> followerList(Long userFollowingId);
	
	public List<SocialReviewVO> followingReviewList(Long userFollowingId);
	
	public List<SocialReviewVO> myReviewList(Long userNum);
	
	public List<SocialReviewVO> followingReviewListPaging(
			@Param("crire") SocialCriteriaReview crire,
			@Param("userNum")Long userNum);
	
	public int getCountByuserNum(Long userNum);
	
	public int getCountByUserNumRating(Long userNum);
}
