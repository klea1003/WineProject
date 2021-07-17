package org.wine.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.wine.domain.SocialCriteriaReview;
import org.wine.domain.SocialListVO;
import org.wine.domain.SocialPageDTO;
import org.wine.domain.SocialReviewVO;
import org.wine.domain.SocialVO;
import org.wine.domain.UserVO;
import org.wine.mapper.SocialMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class SocialServiceImpl implements SocialService {

	@Setter(onMethod_ = @Autowired)
	private SocialMapper mapper;


	@Override
	public int following(SocialVO social) {
		// TODO Auto-generated method stub
		log.info("userFollowingId : "+ social);
		log.info("userFollowerId : "+ social);
		return mapper.following(social);
	}


	@Override
	public int unfollowing(SocialVO social) {
		// TODO Auto-generated method stub네
		log.info("userFollowingId : "+ social);
		log.info("userFollowerId : "+ social);

		return mapper.unfollowing(social);
	}


	@Override
	public SocialVO followingBtn( Long userFollowingId, Long userFollowerId) {
		// TODO Auto-generated method stub
		
		log.info("userFollowingId : "+ userFollowingId);
		
		if(userFollowerId==null) {
			
			userFollowerId = 0L;
				
		}
		
		return  mapper.followingBtn(userFollowingId,userFollowerId);
	}


	@Override
	public int getCountByFollower(Long userFollowingId) {
		// TODO Auto-generated method stub
		return mapper.getCountByFollower(userFollowingId);
	}


	@Override
	public int getCountByFollowing(Long userFollowerId) {
		// TODO Auto-generated method stub
	   return mapper.getCountByFollowing(userFollowerId);
	}


	@Override
	public List<SocialListVO> followingList(Long userFollowerId) {
		
		// TODO Auto-generated method stub
		return mapper.followingList(userFollowerId);
	}


	@Override
	public List<SocialListVO> followerList(Long userFollowingId) {
		// TODO Auto-generated method stub
		return mapper.followerList(userFollowingId);
	}


	@Override
	public List<SocialReviewVO> followingReviewList(SocialCriteriaReview crire,Long userFollowingId) {
		// TODO Auto-generated method stub
		return mapper.followingReviewListPaging(crire,userFollowingId);
	}


	@Override
	public SocialPageDTO followingReviewListPaging(SocialCriteriaReview crire, Long userNum) {
		// TODO Auto-generated method stub
		
		log.info("get List with crire : " + crire);
		return new SocialPageDTO(
				mapper.getCountByuserNum(userNum),
				mapper.followingReviewListPaging(crire,userNum) );
	}


	@Override
	public int getCountByuserNum(Long userNum) {
		// TODO Auto-generated method stub
		return mapper.getCountByuserNum(userNum);
	}


	@Override
	public int getCountByUserNumRating(Long userNum) {
		// TODO Auto-generated method stub
		return mapper.getCountByUserNumRating(userNum);
	}


	@Override
	public List<SocialReviewVO> myReviewList(Long userNum) {
		// TODO Auto-generated method stub
		return mapper.myReviewList(userNum);
	}

}



