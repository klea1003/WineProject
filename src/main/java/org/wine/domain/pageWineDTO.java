package org.wine.domain;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString



public class pageWineDTO{

	private int total; 
	private CriteriaWine cri;
	private int totalPageNum;
	
	public pageWineDTO(CriteriaWine cri, int total) {
		this.cri = cri; this.total = total;
		this.totalPageNum = (int)Math.ceil(total*1.0/cri.getAmount());

	}

	
}
