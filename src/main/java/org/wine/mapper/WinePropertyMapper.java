package org.wine.mapper;

import java.util.List;

import org.wine.domain.WinePropertyVO;

public interface WinePropertyMapper {
	
	public List<WinePropertyVO> getWineTypeList();
	public List<WinePropertyVO> getWineGrapeList();
	public List<WinePropertyVO> getWineRegionList();
	public List<WinePropertyVO> getWineCountryList();
	public List<WinePropertyVO> getWineStyleList();
}
