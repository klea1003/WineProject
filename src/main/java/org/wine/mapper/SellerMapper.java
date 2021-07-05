package org.wine.mapper;

import java.util.List;

import org.wine.domain.SellerVO;


public interface SellerMapper {
	
	public List<SellerVO> getList();
	
	public List<SellerVO> getListWine(Long wineNum);
	
	public SellerVO read(Long sellerNum);
	
	public int update(SellerVO seller);
	
	public int delete(Long sellerNum);

}
