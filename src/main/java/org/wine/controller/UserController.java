package org.wine.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.wine.domain.UserVO;
import org.wine.service.UserService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/user/*")
@AllArgsConstructor
public class UserController {

	private UserService service;

	
	//메인 페이지 이동
	@GetMapping("/main")
	public void mainPageGET() {
		
		log.info("메인 페이지 진입");
		
	}

	
	@GetMapping("/login")
	public void login() {
		log.info("login");
		
	}
	
	@GetMapping("/join")
	public void join() {
		log.info("join");
		
	}
	@PostMapping("/join") 
	public String join(UserVO user, RedirectAttributes rttr) {
		log.info("join : " + user);
		
		service.join(user);
		
		rttr.addFlashAttribute("result", user.getUserNum());
		
		return "redirect:/user/login"; 
	}
	
	@PostMapping("/userIdchk") 
	@ResponseBody
	public String userIdchk(String userId) {
		
		log.info("userIdchk "+ userId);
		
		int result = service.idCheck(userId);
		
		log.info("결과값 = " + result);
		
		if(result != 0) {
			
			return "fail";	
			
		} else {
			
			return "success";
			
		}	
	}
}

