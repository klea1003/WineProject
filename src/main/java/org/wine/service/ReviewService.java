package org.wine.service;

import java.util.ArrayList;

import org.wine.domain.CriteriaReview;
import org.wine.domain.ReviewVO;

public interface ReviewService {

	public void register(ReviewVO review);
	
	public ReviewVO get(Long reviewNum);
	
	public ArrayList<ReviewVO> getList(CriteriaReview cri);
	
	public ArrayList<ReviewVO> getList3(Long wineNum);
	
	public void clickLike(ReviewVO review);
	
	public int getTotal(CriteriaReview cri);	
}
