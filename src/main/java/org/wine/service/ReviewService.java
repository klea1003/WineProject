package org.wine.service;

import java.util.ArrayList;

import org.wine.domain.CriteriaReview;
import org.wine.domain.ReviewPageDTO;
import org.wine.domain.ReviewRatingVO;
import org.wine.domain.ReviewVO;

public interface ReviewService {

	public int register(ReviewVO review);
	
	public ReviewVO get(Long reviewNum);
	
	public ReviewRatingVO getRating(Long wineNum);
	
	public double getAvgRating(Long wineNum);
	
	public ArrayList<ReviewVO> getList(CriteriaReview cri);
	
	public void clickLike(ReviewVO review);

	public ReviewPageDTO getListPage(CriteriaReview cri, Long wno);

	public int getTotal(Long wno);

	public ArrayList<ReviewVO> getMyList(ReviewVO review);

	public int remove(Long reviewNum);

	
	//public int getTotal(CriteriaReview cri); todo. criteria 가 이상해서 확인 후 올릴 것

}
