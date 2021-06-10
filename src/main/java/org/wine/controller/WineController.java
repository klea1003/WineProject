package org.wine.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.wine.domain.WineVO;
import org.wine.service.WineService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("../wine/*")
@AllArgsConstructor
public class WineController {

	private WineService service;
	
	@GetMapping("/list")
	public void list(Model model) {
		log.info("list");
		
		model.addAttribute("list", service.getList());
	}
	
	@PostMapping("/register")
	public String register(WineVO wine, RedirectAttributes rttr) {
		
		log.info("register: " + wine);
		
		service.register(wine);
		
		rttr.addFlashAttribute("result", wine.getWno());
		
		return "redirect:/wine/list";
	}
	
	@GetMapping("/get")
	public void get(@RequestParam("wno") Long wno, Model model) {
		
		log.info("/get");
		model.addAttribute("wine", service.get(wno));
	}
}
