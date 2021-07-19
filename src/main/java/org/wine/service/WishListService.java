package org.wine.service;

import java.util.List;

import org.wine.domain.WishListVO;

public interface WishListService {

	public List<WishListVO> listWish(Long userNum);
	
	public int insert(WishListVO wishList);
	
	public int delete(Long wishNum);
	
	public int countWish(WishListVO wishList);
}