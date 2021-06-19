package org.wine.mapper;

import java.util.List;

import org.wine.domain.SellerVO;


public interface SellerMapper {
	
	public List<SellerVO> getList();
	
	public void sellerInsert(SellerVO seller);
	
	public void sellerSelectKey(SellerVO seller);
	
	public SellerVO read(Long sellerNum);
	
	public int update(SellerVO seller);
	
	public int delete(Long sellerNum);

}
