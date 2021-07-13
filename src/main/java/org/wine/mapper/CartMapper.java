package org.wine.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.wine.domain.CartDisplayVO;
import org.wine.domain.CartVO;

public interface CartMapper {

	void insert(CartVO cartVo);
	
	int updateCart(CartVO cartVo);

	int updateWineQty(CartVO cartVo);

	List<CartDisplayVO> getList(Long userNum);

	public int delete(Long cartNum);

	int getTotalPrice(Long userNum);

	int countWine(@Param("userNum") Long userNum, @Param("wineNum") Long wineNum);

	

}
