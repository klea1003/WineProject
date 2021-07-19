package org.wine.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.wine.domain.WishListVO;
import org.wine.mapper.WishListMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;


@Log4j
@Service
public class WishListServiceImpl implements WishListService {

	@Setter(onMethod_ = @Autowired)
	private WishListMapper mapper;
	
	//목록
	@Override
	public List<WishListVO> listWish(Long userNum) {
		return mapper.getList(userNum);
	}
	
	//추가
	public int insert(WishListVO wishList) {
		return mapper.insert(wishList);
	}

	//삭제
	@Override
	public int delete(Long wineNum) {
		return mapper.delete(wineNum);
	}
	
	//중복상품 검사
	@Override
	public int countWish(WishListVO wishList) {
		return mapper.countWish(wishList);
	}




}