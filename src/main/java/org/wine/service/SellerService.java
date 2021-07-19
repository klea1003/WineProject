package org.wine.service;

import java.util.List;

import org.wine.domain.SellerImageVO;
import org.wine.domain.SellerVO;

public interface SellerService {
	
	public List<SellerVO> getList();
	
	public List<SellerImageVO> getImageList(Long sellerNum);
	
	public SellerVO get(Long sellerNum);
	
	public boolean modify(SellerVO seller);
	
	public boolean remove(Long sellerNum);
	

}
