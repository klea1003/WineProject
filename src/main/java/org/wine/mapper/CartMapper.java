package org.wine.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.wine.domain.CartDisplayVO;
import org.wine.domain.CartVO;

public interface CartMapper {

	public int insert(CartVO cartVo);
	
	public int getCount(@Param("userNum") Long userNum, @Param("wineNum") Long wineNum);

	public int updateWineQty(CartVO cartVo);
	
	public int delete(Long cartNum);
	
	public int deleteByUserAndWine(@Param("userNum") Long userNum, @Param("wineNum") Long wineNum);

	public List<CartDisplayVO> getList(Long userNum);
	
	public int getTotalCartNum(Long userNum);

	public int getTotalPrice(Long userNum);

	public int countWine(@Param("userNum") Long userNum, @Param("wineNum") Long wineNum);

}
