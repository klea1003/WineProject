package org.wine.service;

import java.util.List;

import org.wine.domain.SellerVO;

public interface SellerService {
	
	public List<SellerVO> getList();
	
	public SellerVO get(Long sellerNum);
	
	public boolean modify(SellerVO seller);
	
	public boolean remove(Long sellerNum);
	

}
