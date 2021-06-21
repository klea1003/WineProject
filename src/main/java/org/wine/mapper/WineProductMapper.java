package org.wine.mapper;


import java.util.List;

import org.wine.domain.WineJoinProductVO;


public interface WineProductMapper {
	
	public List<WineJoinProductVO> get(Long sellerNum);

}
