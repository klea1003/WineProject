package org.wine.mapper;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.wine.domain.CartVO;

public interface CartMapper {
	
	
	public List<CartVO> getList();
	public void insertSeletKey(CartVO cartvo);
	
	
	List<CartVO> cartTotalPrice();
	
	
	
	void insert(CartVO cartvo); //상품 추가
	List<CartVO> listCart(Long userNum); //목록 
	void delete(Long cartNum); //장바구니 삭제
	void modifyCart(CartVO cartvo); //장바구니 수량조정
	int sumTotalPrice(Long userNum); //장바구니 금액 합계 리턴
	int countCart(Long userNum, Long sellerNum, Long wno); //장바구니 동일상품 조회
	void updateCart(CartVO cartvo); //동일상품 있을경우 수량추가
	
}
