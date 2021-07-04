package org.wine.mapper;

import java.util.List;

import org.wine.domain.CriteriaReview;
import org.wine.domain.ReviewVO;

public interface ReviewMapper {

	 public List<ReviewVO> getList();
	 public List<ReviewVO> getListWithPaging(CriteriaReview cri);
	 
	 public void insert(ReviewVO review);
	 
	 public ReviewVO read(Long reviewNum);
	 
	 public int delete(Long reviewNum);
	 public int update(ReviewVO review);
	 
	 public int getTotalCount(CriteriaReview cri);
}
