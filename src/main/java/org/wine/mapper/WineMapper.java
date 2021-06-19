package org.wine.mapper;

import java.util.List;

import org.wine.domain.Criteria;
import org.wine.domain.WineVO;

public interface WineMapper {
	
	public List<WineVO> getList();
	
	public List<WineVO> getListWithPaging(Criteria cri); 
	
	public void insert(WineVO wine);
	
	public WineVO read(Long wno);
	
	public int delete(Long wno); 
	
	public int update(WineVO wine);
	
	public int getTotalCount(Criteria cri);
	

}
