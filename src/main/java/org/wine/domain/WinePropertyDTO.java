package org.wine.domain;

import lombok.Data;

@Data
public class WinePropertyDTO {
	WinePropertyVO wineProperty;
	boolean Flag;
	
	public WinePropertyDTO(WinePropertyVO wineProperty, boolean Flag) {
		this.wineProperty = wineProperty;
		this.Flag = Flag;
	}
}
