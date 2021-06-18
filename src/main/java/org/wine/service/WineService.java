package org.wine.service;

import java.util.List;
import org.wine.domain.Criteria;
import org.wine.domain.WineVO;

public interface WineService {
	
	public void register(WineVO wine);
	
	public WineVO get(Long wno);
		
	public List<WineVO> getList(Criteria cri);
	
	public int getTotal(Criteria cri);

}
