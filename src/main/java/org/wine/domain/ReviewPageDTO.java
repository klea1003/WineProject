package org.wine.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;

@Data
@AllArgsConstructor
@Getter

public class ReviewPageDTO {
	private int reviewCnt; 
	private List<ReviewVO> list;
	private int total; 
	private int totalPageNum;
	private CriteriaReview crire;
	
	public ReviewPageDTO(int reviewCnt, List<ReviewVO> list) {
		this.reviewCnt=reviewCnt;
		this.list =list;
		
	}
	
	public ReviewPageDTO(CriteriaReview crire, int total) {
		this.crire = crire;
		this.total = total;
		this.totalPageNum = (int)Math.ceil(total*1.0/crire.getAmount());

		
	}
}
