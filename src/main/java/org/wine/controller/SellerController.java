package org.wine.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.wine.domain.SellerVO;
import org.wine.service.SellerService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/seller/*")
@AllArgsConstructor
public class SellerController {
	
	private SellerService service;
	
	@GetMapping("/list")
	public void list(Model model){
		
		log.info("list");
		
		model.addAttribute("list", service.getList());
		
	}
	
	@PostMapping("/register")
	public String register(SellerVO seller, RedirectAttributes rttr){
		
		log.info("register: " + seller);
		
		service.register(seller);
		
		rttr.addFlashAttribute("result", seller.getSellerNum());
		
		return "redirect:/seller/list";
	}

	@GetMapping("/get") public void get(@RequestParam("sellerNum") Long sellerNum, Model model) {
		  
		  log.info("/get");
		  
		  model.addAttribute("seller", service.get(sellerNum));
		  
	}
	
	@PostMapping("/modify")
	public String modify(SellerVO seller, RedirectAttributes rttr) {
		
		log.info("modify: " + seller);
		
		if(service.modify(seller)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		return "redirect:/seller/list";
	}
	
	@PostMapping("/remove")
	public String remove(@RequestParam("sellerNum") Long sellerNum, RedirectAttributes rttr) {
		
		log.info("remove...." + sellerNum);
		
		if(service.remove(sellerNum)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		return "redirect:/seller/list";
	}
	
}
