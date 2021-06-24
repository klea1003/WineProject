package org.wine.service;

import java.util.List;

import org.wine.domain.WineJoinProductVO;

public interface WineProductService {
	
	public List<WineJoinProductVO> get(Long sellerNum);
	
}
