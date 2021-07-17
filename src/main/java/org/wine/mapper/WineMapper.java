package org.wine.mapper;

import java.util.List;

import org.wine.domain.CriteriaWine;
import org.wine.domain.WineVO;

public interface WineMapper {
	
	public List<WineVO> getList();
	
	public List<WineVO> getListWithPaging(CriteriaWine cri); 
	
	public void insert(WineVO wine);
	
	public WineVO read(Long wno);
	
	public int delete(Long wno); 
	
	public int getTotalCount(CriteriaWine cri);
	
}
