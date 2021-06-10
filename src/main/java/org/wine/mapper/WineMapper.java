package org.wine.mapper;

import java.util.List;

import org.wine.domain.WineVO;

public interface WineMapper {
	
	public List<WineVO> getList();
	
	public void insert(WineVO wine);
	
	public WineVO read(Long wno);
	
	public int delete(Long wno); 
	
	public int update(WineVO wine);
	

}
