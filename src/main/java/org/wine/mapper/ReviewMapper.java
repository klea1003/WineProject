package org.wine.mapper;

import java.util.ArrayList;

import org.wine.domain.CriteriaReview;
import org.wine.domain.ReviewRatingVO;
import org.wine.domain.ReviewVO;

public interface ReviewMapper {

	 public ArrayList<ReviewVO> getList();
	 public ArrayList<ReviewVO> getMyList(ReviewVO review);
	 public ArrayList<ReviewVO> getListWithPaging(CriteriaReview cri);
	 public ReviewRatingVO getRating(Long wineNum);
	 public double getAvgRating(Long wineNum);
	 public void insert(ReviewVO review);
	 
	 public int readLike(ReviewVO review);
	 public void insertLike(ReviewVO review);
	 public void deleteLike(ReviewVO review);
	 public void upLike(ReviewVO review);
	 public void downLike(ReviewVO review);
	 
	 public ReviewVO read(Long reviewNum);
	 
	 public int delete(Long reviewNum);
	 public int update(ReviewVO review);
	 
	 public int getTotalCountAll(Long wineNum);
}
