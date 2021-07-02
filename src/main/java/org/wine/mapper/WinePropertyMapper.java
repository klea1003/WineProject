package org.wine.mapper;

import java.util.ArrayList;

import org.wine.domain.WinePropertyVO;

public interface WinePropertyMapper {
	public ArrayList<WinePropertyVO> getWinePropertyList(String propertyArea);
}
