package org.wine.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;
import org.wine.domain.CriteriaReview;
import org.wine.domain.ReviewPageDTO;
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
	public int register(ReviewVO review) {
		
		Float a = Float.parseFloat(review.getRating());
		review.setRatingF(a);
		log.info("register......." + review);
		mapper.insert(review);
		
		return 1;
	}
	
	
	@Override
	public int remove(Long reviewNum) {
		
		log.info("remove......." + reviewNum);
		
		
		return mapper.delete(reviewNum);
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
	public ArrayList<ReviewVO> getMyList(ReviewVO review){
		
		log.info("get List with Criteria: "+review);
		
		return mapper.getMyList(review);
	}
	
	
	@Override
	public int getTotal(Long wno) {
		
		log.info("get Total: "+ wno);
		
		return mapper.getTotalCountAll(wno);
	}
	
	@Override
	public ReviewPageDTO getListPage(CriteriaReview cri, Long wineNum){
		
		log.info("get List with reviewCriteria: "+ cri);
		
		cri.setWineNum(wineNum.intValue());
		return new ReviewPageDTO(
				mapper.getTotalCountAll(wineNum),
				mapper.getListWithPaging(cri));
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
		return mapper.getRating(wineNum);
		
	}
	
	@Override
	public double getAvgRating(Long wineNum) {
		if (mapper.getTotalCountAll(wineNum) > 0) {
			return mapper.getAvgRating(wineNum);
		} else {
			return 0.0;
		}		
	}
}
