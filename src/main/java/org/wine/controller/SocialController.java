package org.wine.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.wine.domain.SocialVO;
import org.wine.service.SocialService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RestController
@Log4j
@RequestMapping("/social/")
@AllArgsConstructor
public class SocialController {

	@Autowired
	private SocialService service;

	
	  @PostMapping(value="/following", consumes="application/json", produces={MediaType.TEXT_PLAIN_VALUE})
	  public ResponseEntity<String> following(@RequestBody SocialVO social) { 
	  log.info("SocialVO : " +social); 
	  int  insertCount=service.following(social); 
	  log.info("Following INSERT COUNT : "  +insertCount); 
	  return insertCount==1 ? new ResponseEntity<>("success",HttpStatus.OK) :new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR); 
	  }
	 
	  @PostMapping(value = "/unfollowing"  , consumes="application/json", produces={MediaType.TEXT_PLAIN_VALUE})
	  public ResponseEntity<String> unFollowing(@RequestBody SocialVO social) {
      log.info("unFollowing : "+ social );
      int  deleteCount=service.unfollowing(social); 
      return deleteCount == 1 
			? new ResponseEntity<>("success", HttpStatus.OK)
			: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	  }
	  
	
	
}
