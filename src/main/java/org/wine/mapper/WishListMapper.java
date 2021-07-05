package org.wine.mapper;
import java.util.List;

import org.wine.domain.WishListVO;

public interface WishListMapper {

	
	//위시리스트 목록
	public List<WishListVO> listWish(Long userNum); 

	//위시리스트 상품 추가
	public int insert(WishListVO wishList);
	
	//상품 삭제
	public int delete(Long wineNum); 
	
	//중복 상품 여부
	public int countWish(WishListVO wishList);

	
	public List<WishListVO> getList();
}
