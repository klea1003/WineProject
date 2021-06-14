package org.wine.service;

import org.wine.domain.UserVO;

public interface UserService {
		
		
		public void join(UserVO user);
		
		public int idCheck(String userId);
		
		public int nicknameCheck(String userNickName);
		
		public UserVO userLogin(UserVO user);
}
