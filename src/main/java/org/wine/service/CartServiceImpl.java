package org.wine.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.wine.domain.CartVO;
import org.wine.mapper.CartMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;


@Log4j
@Service
public class CartServiceImpl implements CartService {

	@Setter(onMethod_ = @Autowired)
	private CartMapper mapper;
	
	//추가
	@Override
	public int insert(CartVO cartvo) {
		return mapper.insert(cartvo);
	}

	//목록
	@Override
	public List<CartVO> listCart(Long userNum) {
		return mapper.listCart(userNum);
	}

	//삭제
	@Override
	public int delete(Long cartNum) {
		return mapper.delete(cartNum);
	}

	//수정

	@Override
	public int modifyCart(CartVO cartvo) {
		return mapper.modifyCart(cartvo);
	}

	//장바구니 합계	
	@Override
	public int sumTotalPrice(Long userNum) {
		return mapper.sumTotalPrice(userNum);
	}

	//장바구니 상품 확인
	@Override
	public int countCart(CartVO cartvo) {
		// TODO Auto-generated method stub
		return mapper.countCart(cartvo);
	}

	//장바구니 상품수량 변경
	@Override
	public int updateCart(CartVO cartvo) {
		return mapper.updateCart(cartvo);

	}


}