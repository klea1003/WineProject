package org.wine.domain;

import lombok.Data;

@Data
public class WinePropertyDTO {
	WinePropertyVO wineProperty;
	boolean flag;
	
	public WinePropertyDTO(WinePropertyVO wineProperty, boolean Flag) {
		this.wineProperty = wineProperty;
		this.flag = Flag;
	}
}
