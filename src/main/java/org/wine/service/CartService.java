package org.wine.service;

import java.util.List;

import org.wine.domain.CartDisplayVO;
import org.wine.domain.CartVO;

public interface CartService {

	public int addWine(CartVO cartVo);
	
	public int modifyCart(CartVO cartvo);
	
	public int deleteCart(Long cartNum);
	
	public int deleteCartByUserAndWine(Long userNum, Long wineNUm);
	
	public List<CartDisplayVO> getList(Long userNum);
	
	public int getTotalPrice(Long userNum);
	
	public int getWineQty(Long userNum, Long wineNum);
		
}
