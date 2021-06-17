package org.wine.service;

import java.util.List;

import org.wine.domain.CartVO;

public interface CartService {

	public void insert(CartVO cartvo); //추가
	public List<CartVO> listCart(Long userNum); //목록
	public void delete(Long userNum); //삭제
	public void modifyCart(CartVO cartvo); //수정
	public int sumTotalPrice(Long userNum); //합계
	public int countCart(Long userNum, Long sellerNum, Long wineNum); //상품확인
	public void updateCart(CartVO cartvo); //상품수량변경
	
	
		
}
