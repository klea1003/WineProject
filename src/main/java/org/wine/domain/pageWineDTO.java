package org.wine.domain;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString



public class pageWineDTO{

	private int total; 
	private CriteriaWine cri;
	private int realEnd;
	
	public pageWineDTO(CriteriaWine cri, int total) {
		this.cri = cri; this.total = total;
		this.realEnd = (int)Math.ceil(total*1.0/cri.getAmount());

	}
	
	
}
