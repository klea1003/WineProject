package org.wine.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
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

	@GetMapping("/login")
	public void login() {
		log.info("login");
		
	}
	
	@GetMapping("/join")
	public void join() {
		log.info("join");
		
	}
	@PostMapping("/join") //회원가입
	public String join(UserVO user, RedirectAttributes rttr) {
		log.info("join : " + user);
		
		service.join(user);
		
		rttr.addFlashAttribute("result", user.getUserNum());
		
		return "redirect:/user/login"; // redirect를 하지않은 경우, 새로 고침시 도배
	}
	
	
}

