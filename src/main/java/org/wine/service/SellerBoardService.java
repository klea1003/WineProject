package org.wine.service;

import java.util.List;

import org.wine.domain.SellerBoardVO;

public interface SellerBoardService {
	
	public void register(SellerBoardVO board);
	
	public SellerBoardVO get(Long sellerBno);
	
	public boolean modify(SellerBoardVO board);
	
	public boolean remove(Long sellerBno);
	
	public List<SellerBoardVO> getList();	

}
