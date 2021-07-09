package org.wine.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/footer/*")
@AllArgsConstructor
public class FooterController {

	
	@GetMapping("/privacy")
	public void footerPrivacy () {
		
		log.info("footer privacy 페이지");
		
	}
	
	@GetMapping("/terms")
	public void footerTerms () {
		
		log.info("footer Terms 페이지");
		
	}
	
	@GetMapping("/contact")
	private void footerContact() {
		
		log.info("footer contact 페이지");

	}
	
	
}
