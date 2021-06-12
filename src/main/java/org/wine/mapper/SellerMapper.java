package org.wine.mapper;

import java.util.List;

import org.wine.domain.SellerVO;


public interface SellerMapper {
	
	public List<SellerVO> getList();
	
	public void insert(SellerVO seller);

}
