package org.wine.controller;


import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.wine.domain.CriteriaReview;
import org.wine.domain.ReplyVO;
import org.wine.domain.ReviewPageDTO;
import org.wine.domain.ReviewVO;
import org.wine.domain.SocialCriteriaReview;
import org.wine.domain.SocialPageDTO;
import org.wine.domain.SocialReviewVO;
import org.wine.domain.SocialVO;
import org.wine.service.ReviewService;
import org.wine.service.SocialService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RestController
@Log4j
@RequestMapping("/reviews/")
@AllArgsConstructor
public class ReviewController {

	@Autowired
	private ReviewService reviewService;

	@PostMapping(value="/new", consumes="application/json", produces= {MediaType.TEXT_PLAIN_VALUE})
	   public ResponseEntity<String> create(@RequestBody ReviewVO vo) {
	      log.info("ReviewVO : " +vo);
	      int insertCount=reviewService.register(vo);
	      log.info("Reply INSERT COUNT : " +insertCount);
	      return insertCount==1 ? new ResponseEntity<>("success",HttpStatus.OK)
	            :new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	   }
	
	@DeleteMapping(value = "/{reviewNum}" , produces= {MediaType.TEXT_PLAIN_VALUE} )
	   public ResponseEntity<String> remove(@PathVariable("reviewNum")Long reviewNum) {
	      log.info("remove : "+reviewNum );
	      return reviewService.remove(reviewNum)==1
	            ? new ResponseEntity<>("success", HttpStatus.OK)
	            : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	   }
	 
	
	  @GetMapping(value="/pages/{wineNum}/{page}", 
			  produces= {MediaType.APPLICATION_XML_VALUE, 
					  MediaType.APPLICATION_JSON_VALUE})
	   public ResponseEntity<ReviewPageDTO> getReviewList(@PathVariable("page")int page, @PathVariable("wineNum")Long wineNum) {
	      
		 CriteriaReview cri=new CriteriaReview(page, 10);
	      
	      log.info("modal review: "+cri);
	      return new ResponseEntity<>(reviewService.getListPage(cri, wineNum), 
	    		  HttpStatus.OK);
	   }
	   
}
