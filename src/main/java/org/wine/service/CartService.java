package org.wine.service;

import java.util.List;

import org.wine.domain.CartVO;

public interface CartService {

	public int insert(CartVO cartvo); //추가
	public List<CartVO> listCart(Long userNum); //목록
	public int delete(Long userNum); //삭제
	public int modifyCart(CartVO cartvo); //수정
	public int sumTotalPrice(Long userNum); //합계
	public int countCart(CartVO cartvo); //상품확인
	public int updateCart(CartVO cartvo); //상품수량변경
	
	
		
}
