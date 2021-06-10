package org.wine.service;

import org.wine.domain.UserVO;

public interface UserService {

		public void join(UserVO user);
		
		public boolean login(UserVO user);
}
