package org.wine.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;

@Data
@AllArgsConstructor
@Getter

public class SocialPageDTO {
	private int socialReviewCnt;
	private List<SocialReviewVO> list;
	private int total; 
	private int totalPageNum;
	private SocialCriteriaReview crire;
	
	public SocialPageDTO(int socialReviewCnt, List<SocialReviewVO> list) {
		this.socialReviewCnt=socialReviewCnt;
		this.list =list;
		
	}
	
	public SocialPageDTO(SocialCriteriaReview crire, int total) {
		this.crire = crire;
		this.total = total;
		this.totalPageNum = (int)Math.ceil(total*1.0/crire.getAmount());

		
	}
}
