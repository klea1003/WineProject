package org.wine.mapper;

import java.util.List;

import org.wine.domain.SellerBoardVO;


public interface SellerBoardMapper {
	
	public List<SellerBoardVO> getList();
	
	public void insert(SellerBoardVO board);
	
	public void insertSelectKey(SellerBoardVO board);
	
	public SellerBoardVO read(Long sellerBno);
	
	public int update(SellerBoardVO board);
	
	public int delete(Long sellerBno);
	
	

}
