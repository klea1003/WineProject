package org.wine.service;

import org.wine.domain.UserVO;

public interface UserService {
		
		//ȸ������
		public void join(UserVO user);
		//���̵� �ߺ� �˻�
		public int idCheck(String userID);
		
		public boolean login(UserVO user);
}
