package org.wine.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.wine.domain.ProfileVO;
import org.wine.domain.SocialWishVO;
import org.wine.domain.UserVO;
import org.wine.mapper.UserAttachMapper;
import org.wine.mapper.UserMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class UserServiceImpl implements UserService {

	@Setter(onMethod_ = @Autowired)
	private UserMapper mapper;
	
	@Setter(onMethod_ = @Autowired)
	private UserAttachMapper attachMapper;

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

	@Override
	public void register(UserVO user) {
		// TODO Auto-generated method stub
		if(user.getProfileList() == null||user.getProfileList().size()<=0) {
			log.info("return");
			return;
		}
		log.info(user.getProfileList().get(0).getProfileFileName());
		user.getProfileList().forEach(attach->{
		log.info("attachtest");
		
		log.info("usernum"+attach.getUserNum());
		log.info("filename"+attach.getProfileFileName());
		log.info("path"+attach.getProfileUploadPath());
		log.info("uuid"+attach.getProfileUuid());
		log.info("type"+attach.isProfileFileType());
		
		log.info(attach);
		
		
		
		attachMapper.insert(attach);
		
		});
	}

	@Override
	public List<ProfileVO> getAttachList(Long userNum) {
		// TODO Auto-generated method stub
		
		log.info("get Attach list by bno" + userNum);
		
		return attachMapper.findByUserNum(userNum);
	}

	@Override
	public List<ProfileVO> imageCk(Long userNum) {
		// TODO Auto-generated method stub
		return attachMapper.findByUserNumCK(userNum);
	}

	@Override
	public int remove(Long userNum) {
		// TODO Auto-generated method stub
		
		log.info("remove...."+ userNum) ;
		
		return attachMapper.deleteimage(userNum);
	}

	@Override
	public List<SocialWishVO> getwishList(Long userNum) {
		// TODO Auto-generated method stub
		return mapper.getwishList(userNum);
	}

	@Override
	public int modifyEmail(UserVO user) {
		// TODO Auto-generated method stub
		return mapper.modifyEmail(user);
	}

	@Override
	public int modifyPassword(UserVO user) {
		// TODO Auto-generated method stub
		return mapper.modifyPassword(user);
	}

	@Override
	public int modifyUserInfo(UserVO user) {
		// TODO Auto-generated method stub
		return mapper.modifyUserInfo(user);
	}

	@Override
	public int getwishListCnt(Long userNum) {
		// TODO Auto-generated method stub
		return mapper.getwishListCnt(userNum);
	}

	@Override
	public int modifyNickName(UserVO user) {
		// TODO Auto-generated method stub
		return mapper.modifyNickName(user);
	}

}
