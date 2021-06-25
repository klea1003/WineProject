package org.wine.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.wine.domain.UserVO;
import org.wine.mapper.UserMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class UserServiceImpl implements UserService {

	@Setter(onMethod_ = @Autowired)
	private UserMapper mapper;

	@Override
	public List<UserVO> getList() {
		// TODO Auto-generated method stub
		log.info("getList............");
		
		return mapper.getList();
	}
	
	@Override
	public void join(UserVO user) {
		// TODO Auto-generated method stub
		log.info("join" + user);

		mapper.joinSelectKey(user);
	}

	@Override
	public UserVO userLogin(UserVO user) {
		// TODO Auto-generated method stub
		return mapper.userLogin(user);
	}

	@Override
	public int idCheck(String userId) {
		// TODO Auto-generated method stub
		return mapper.idCheck(userId);
	}

	@Override
	public int nicknameCheck(String userNickName) {
		// TODO Auto-generated method stub
		return mapper.nicknameCheck(userNickName);
	}

	@Override
	public UserVO get(Long userNum) {
		// TODO Auto-generated method stub
		log.info("get...."+userNum);
		return mapper.read(userNum);
	}

}
