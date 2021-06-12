package org.wine.service;

import org.wine.domain.UserVO;

public interface UserService {
		
		//회원가입
		public void join(UserVO user);
		//아이디 중복 검사
		public int idCheck(String userID);
		
		public boolean login(UserVO user);
}
