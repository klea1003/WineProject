package org.wine.mapper;
import java.util.List;

import org.wine.domain.WishListVO;

public interface WishListMapper {

	public List<WishListVO> getList(Long userNum); 

	public int insert(WishListVO wishList);
	
	public int delete(Long wineNum); 
	
	public int countWish(WishListVO wishList);
		
}
