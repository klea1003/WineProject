package org.wine.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.wine.domain.SocialVO;
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
	public SocialVO followingBtn(Long userFollowingId) {
		// TODO Auto-generated method stub
		
		log.info("userFollowingId : "+ userFollowingId);
		
		return mapper.followingBtn(userFollowingId);
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

}



