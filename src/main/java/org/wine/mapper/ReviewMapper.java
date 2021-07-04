package org.wine.mapper;

import java.util.ArrayList;

import org.wine.domain.CriteriaReview;
import org.wine.domain.ReviewVO;

public interface ReviewMapper {

	 public ArrayList<ReviewVO> getList();
	 public ArrayList<ReviewVO> getListWithPaging(CriteriaReview cri);
	 
	 public void insert(ReviewVO review);
	 
	 public ReviewVO read(Long reviewNum);
	 
	 public int delete(Long reviewNum);
	 public int update(ReviewVO review);
	 
	 public int getTotalCount(CriteriaReview cri);
}
