package org.wine.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.wine.domain.CartDisplayVO;
import org.wine.domain.CartVO;
import org.wine.mapper.CartMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class CartServiceImpl implements CartService {

	@Setter(onMethod_ = @Autowired)
	private CartMapper mapper;

	// 추가
	@Override
	public int addWine(CartVO cartVo) {

		Long userNum = cartVo.getUserNum();
		Long wineNum = cartVo.getWineNum();
		int ret = 0;

		if (mapper.countWine(userNum, wineNum) != 0) { // 이미 와인이 존재하는 경우

			int currentWineQty = mapper.getCount(userNum, wineNum);

			CartVO newCartVo = new CartVO();
			newCartVo.setUserNum(userNum);
			newCartVo.setWineNum(wineNum);
			newCartVo.setWineQty(currentWineQty + cartVo.getWineQty());

			ret = mapper.updateWineQty(newCartVo);

		} else { // 와인이 카트에 존재하지 않는 경우

			ret = mapper.insert(cartVo);

		}
		return ret;
	}	

	// 수정
	@Override
	public int modifyCart(CartVO cartvo) {
		return mapper.updateWineQty(cartvo);
	}

	// 삭제
	@Override
	public int deleteCart(Long cartNum) {
		return mapper.delete(cartNum);
	}
	
	@Override
	public int deleteCartByUserAndWine(Long userNum, Long wineNum) {
		return mapper.deleteByUserAndWine(userNum, wineNum);
	}

	// 목록
	@Override
	public List<CartDisplayVO> getList(Long userNum) {
		return mapper.getList(userNum);
	}

	// 장바구니 합계
	@Override
	public int getTotalPrice(Long userNum) {
		if(mapper.getTotalCartNum(userNum) == 0) {
			return 0;
		} else {
			return mapper.getTotalPrice(userNum);
		}		
	}
	
	@Override
	public int getWineQty(Long userNum, Long wineNum) {
		return mapper.getCount(userNum, wineNum);
	}

}