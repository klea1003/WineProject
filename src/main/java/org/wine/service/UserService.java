package org.wine.service;

import java.util.List;

import org.wine.domain.ProfileVO;
import org.wine.domain.SocialWishVO;
import org.wine.domain.UserVO;

public interface UserService {
		
		public List<UserVO> getList();
	
		public void join(UserVO user);
		
		public UserVO get(Long userNum);
		
		public int idCheck(String userId);
		
		public int nicknameCheck(String userNickName);
		
		public UserVO userLogin(UserVO user);
		
		public void register(UserVO user);
		
		public List<ProfileVO> getAttachList(Long userNum);
		
		public List<ProfileVO> imageCk(Long userNum);
		
		public int remove(Long userNum);
		
		public List<SocialWishVO> getwishList(Long userNum); //목록
		
		public int modifyEmail(UserVO user);
		
		public int modifyNickName(UserVO user);
		
		public int modifyPassword(UserVO user);
		
		public int modifyUserInfo(UserVO user);
		
		public int getwishListCnt(Long userNum);
}
