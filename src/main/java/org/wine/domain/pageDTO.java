package org.wine.domain;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString



public class pageDTO {

	private int startPage; //처음페이지
	private int endPage; //마지막페이지
	private boolean prev, next; //전, 후 페이지
	private int total; //전체
	private Criteria cri;
	public pageDTO(Criteria cri, int total) {
		this.cri = cri; this.total = total;
		this.endPage = (int)Math.ceil(cri.getPageNum()/10.)*10;
		this.startPage = this.endPage-9;
		int realEnd = (int)Math.ceil(total*1.0/cri.getAmount());
		if(realEnd<this.endPage) {
			this.endPage = realEnd;
		}
		this.prev = this.startPage > 1;
		this.next = this.endPage < realEnd;
	}
	
	
}
