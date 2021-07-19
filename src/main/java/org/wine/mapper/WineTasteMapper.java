package org.wine.mapper;

import java.util.List;

import org.wine.domain.WineTasteVO;

public interface WineTasteMapper {
	
	public List<WineTasteVO> getList(Long wineNum);
	
}
