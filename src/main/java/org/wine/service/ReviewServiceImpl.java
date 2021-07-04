package org.wine.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;
import org.wine.domain.CriteriaReview;
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
	public int getTotal(CriteriaReview cri) {
		
		log.info("getTotal with Criteria: " + cri);
		
		return mapper.getTotalCount(cri);
		
	}
}
