package org.wine.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.springframework.stereotype.Service;
import org.wine.domain.CriteriaWine;
import org.wine.domain.WinePropertyDTO;
import org.wine.domain.WinePropertyVO;
import org.wine.domain.WineRatingVO;
import org.wine.domain.WineVO;
import org.wine.mapper.WineMapper;
import org.wine.mapper.WinePropertyMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class WineServiceImpl implements WineService {

	private WineMapper mapper;
	private WinePropertyMapper propertyMapper;

	@Override
	public void register(WineVO wine) {
		
		log.info("register......." + wine);
		
		mapper.insert(wine);
	}

	@Override
	public WineRatingVO get(Long wno) {

		log.info("get......." + wno);
		
		return mapper.readWithRating(wno);
	}

	@Override
	public List<WineRatingVO> getList(CriteriaWine cri) {
		
		log.info("get List with CriteriaWine: "+ cri);
		
		return mapper.getRatingListWithPaging(cri);

	}
	@Override
	public int getTotal(CriteriaWine cri) {
		
		log.info("get total count");
		return mapper.getTotalCountWithPaging(cri);
		
	}
	
	public ArrayList<WinePropertyDTO> getWinPropertyDTO(String propertyArea, ArrayList<Integer> ids){
		
		ArrayList<String> listArea = new ArrayList<>(Arrays.asList(
				"wine_type", "wine_grape", "wine_region", "wine_country", "wine_style"));
		
		if(listArea.contains(propertyArea) == false) {
			return null;
		}		

		ArrayList<WinePropertyVO> list = propertyMapper.getWinePropertyList(propertyArea);
		
		ArrayList<WinePropertyDTO> results = new ArrayList<WinePropertyDTO>();
		
		for (int i=0; i < list.size(); i++) {
			WinePropertyVO propertyVO = list.get(i);
			
			if(ids != null && ids.contains(propertyVO.getIdx())) {
				WinePropertyDTO newPropertyDTO = new WinePropertyDTO(propertyVO, true);
				results.add(newPropertyDTO);
			} else {
				WinePropertyDTO newPropertyDTO = new WinePropertyDTO(propertyVO, false);
				results.add(newPropertyDTO);
			}			
		}
		
		return results;
	}
		

}
