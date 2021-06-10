package org.wine.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.wine.domain.WineVO;
import org.wine.mapper.WineMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class WineServiceImpl implements WineService {

	private WineMapper mapper;

	@Override
	public void register(WineVO wine) {
		
		log.info("register......." + wine);
		
		mapper.insert(wine);
	}

	@Override
	public WineVO get(Long wno) {

		log.info("get......." + wno);
		
		return mapper.read(wno);
	}

	@Override
	public List<WineVO> getList() {
		
		log.info("getList............");
		
		return mapper.getList();

	}

}
