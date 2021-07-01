package org.wine.service;

import java.util.List;

import org.wine.domain.ProfileVO;
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
}
