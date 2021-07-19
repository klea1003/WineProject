package org.wine.service;

import java.util.ArrayList;

import org.wine.domain.CriteriaReview;
import org.wine.domain.ReviewRatingVO;
import org.wine.domain.ReviewVO;

public interface ReviewService {

	public void register(ReviewVO review);
	
	public ReviewVO get(Long reviewNum);
	
	public ReviewRatingVO getRating(Long wineNum);
	
	public double getAvgRating(Long wineNum);
	
	public ArrayList<ReviewVO> getList(CriteriaReview cri);
	
	public void clickLike(ReviewVO review);
	
	//public int getTotal(CriteriaReview cri); todo. criteria 가 이상해서 확인 후 올릴 것

}
