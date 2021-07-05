package org.wine.mapper;

import java.util.List;

import org.wine.domain.SocialWishVO;
//import org.apache.ibatis.annotations.Select;
import org.wine.domain.UserVO;

public interface UserMapper {
	
	//@Select("select * from TBL_USER_TEST where user_num>0")
	public List<UserVO> getList();
	
	public UserVO read(Long userNum);
	
	public void join(UserVO user);
	
	public void joinSelectKey(UserVO user);
	
	public int update(UserVO user);
	
	public int idCheck(String userId); 
	
	public int nicknameCheck(String userNickName); 
	
	public UserVO userLogin(UserVO user);
	
	public List<SocialWishVO> getwishList(Long userNum);
}
