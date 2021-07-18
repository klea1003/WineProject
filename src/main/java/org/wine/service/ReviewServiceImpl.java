package org.wine.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;
import org.wine.domain.CriteriaReview;
import org.wine.domain.ReviewRatingVO;
import org.wine.domain.ReviewVO;
import org.wine.mapper.ReviewMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class ReviewServiceImpl implements ReviewService{
	private ReviewMapper mapper;
	
	@Override
	public void register(ReviewVO review) {
		
		log.info("register......." + review);
		
		mapper.insert(review);
	}
	
	@Override
	public ReviewVO get(Long reviewNum) {
		
		log.info("get......." + reviewNum);
		
		return mapper.read(reviewNum);
	}
	
	@Override
	public ArrayList<ReviewVO> getList(CriteriaReview cri){
		
		log.info("get List with Criteria: "+ cri);
		
		return mapper.getListWithPaging(cri);
	}
	
	@Override
	public ArrayList<ReviewVO> getList3(Long wineNum){
		
		log.info("get  getList3 : "+ wineNum);
		log.info(mapper.getList3(wineNum));
		return mapper.getList3(wineNum);
	}
	
	@Override
	public void clickLike(ReviewVO review){	
		log.info("click like");
		int count =mapper.readLike(review);
		if(count==0) {
			mapper.insertLike(review);
			mapper.upLike(review);
			log.info("click like up!"+review.getReviewNum());
		}else {
			mapper.deleteLike(review);
			mapper.downLike(review);
			log.info("click like down"+review.getReviewNum());
		}
		
	}
	
	@Override
	public ReviewRatingVO getRating(Long wineNum) {
		
		log.info("getRating: " +  wineNum);
		ReviewRatingVO rating = mapper.getRating( wineNum);
		
		Long all = rating.getRating1()+rating.getRating2()+rating.getRating3()+rating.getRating4()+rating.getRating5();
		
		Long allStar = (rating.getRating1()*1)+(rating.getRating2()*2)+(rating.getRating3()*3)+(rating.getRating4()*4)+(rating.getRating5()*5);
		log.info(allStar/all);
		rating.setRatingAll(allStar/all);
		return rating;
		
	}
	
	@Override
	public int getTotal(CriteriaReview cri) {
		
		log.info("getTotal with Criteria: " + cri);
		
		return mapper.getTotalCount(cri);
		
	}
}
