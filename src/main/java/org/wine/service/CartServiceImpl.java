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
	public void insert(CartVO cartvo) {
		mapper.insert(cartvo);
	}

	//목록
	@Override
	public List<CartVO> listCart(Long userNum) {
		return mapper.listCart(userNum);
	}

	//삭제
	@Override
	public void delete(Long cartNum) {
		mapper.delete(cartNum);
	}

	//수정

	@Override
	public void modifyCart(CartVO cartvo) {
		mapper.modifyCart(cartvo);
	}

	//장바구니 합계	
	@Override
	public int sumTotalPrice(Long userNum) {
		return mapper.sumTotalPrice(userNum);
	}

	//장바구니 상품 확인
	@Override
	public int countCart(Long userNum, Long sellerNum, Long wno) {
		// TODO Auto-generated method stub
		return mapper.countCart(userNum, sellerNum, wno);
	}

	//장바구니 상품수량 변경
	@Override
	public void updateCart(CartVO cartvo) {
		mapper.updateCart(cartvo);

	}


}