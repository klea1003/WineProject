package org.wine.service;

import java.util.List;

import org.wine.domain.SellerVO;

public interface SellerService {
	
	public SellerVO get(Long sellerNum);
	
	public List<SellerVO> getListWine(Long wineNum);
	
	public boolean modify(SellerVO seller);
	
	public boolean remove(Long sellerNum);
	
	public List<SellerVO> getList();

}
