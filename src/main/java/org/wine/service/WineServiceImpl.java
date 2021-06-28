package org.wine.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.wine.domain.CriteriaWine;
import org.wine.domain.WineVO;
import org.wine.mapper.WineMapper;

import lombok.AllArgsConstructor;
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
	public List<WineVO> getList(CriteriaWine cri) {
		
		log.info("get List with CriteriaWine: "+ cri);
		
		return mapper.getListWithPaging(cri);

	}
	@Override
	public int getTotal(CriteriaWine cri) {
		
		log.info("get total count");
		return mapper.getTotalCount(cri);
		
	}
		

}
