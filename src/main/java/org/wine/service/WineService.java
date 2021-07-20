package org.wine.service;

import java.util.ArrayList;
import java.util.List;

import org.wine.domain.CriteriaWine;
import org.wine.domain.WinePropertyDTO;
import org.wine.domain.WineTasteVO;
import org.wine.domain.WineVO;

public interface WineService {
	
	public void register(WineVO wine);
	
	public WineVO get(Long wno);
		
	public List<WineVO> getList(CriteriaWine cri);
	
	public List<WineVO> getListSameWinery(Long wno);
	
	public int getTotal(CriteriaWine cri);
	
	public ArrayList<WinePropertyDTO> getWinPropertyDTO(String propertyArea, ArrayList<Integer> ids);
	
	public List<WineTasteVO> getTasteList(Long wno);

}
