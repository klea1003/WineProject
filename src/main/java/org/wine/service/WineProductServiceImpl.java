package org.wine.service;



import java.util.List;

import org.springframework.stereotype.Service;
import org.wine.domain.WineJoinProductVO;
import org.wine.mapper.WineProductMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;



@Log4j
@Service
@AllArgsConstructor
public class WineProductServiceImpl implements WineProductService{
	
	private WineProductMapper mapper;

	@Override
	public List<WineJoinProductVO> get(Long sellerNum) {
		
		log.info("get........." + sellerNum);
		
		return mapper.get(sellerNum);
	}

	
	

}
