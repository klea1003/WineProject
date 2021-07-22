package org.wine.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.wine.domain.SellerBoardVO;
import org.wine.service.SellerBoardService;



import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/sellerBoard/*")
@AllArgsConstructor
public class SellerBoardController {
	
	private SellerBoardService service;
	
	@GetMapping("/list")
	public void list(Model model) {
		
		log.info("list");
		
		model.addAttribute("list", service.getList());
		
	}
	
	@GetMapping("/register")
	public void register() {
		
	}
	
	@PostMapping("/register")
	public String register(SellerBoardVO sellerboard, RedirectAttributes rttr) {
		
		log.info("특판문의 게시글 등록: " + sellerboard);
		
		service.register(sellerboard);
		
		rttr.addFlashAttribute("sellerBoardResult", sellerboard.getParentSellerBno());
		
		return "redirect:/sellerBoard/list";
		
	}
	
	@GetMapping("/get")
	public void get(@RequestParam("parentSellerBno") Long parentSellerBno, Model model) {
		
		log.info("/get");
		
		model.addAttribute("sellerBoard", service.get(parentSellerBno));
		model.addAttribute("answerBtn", service.answerBtn(parentSellerBno));
	}
	
	@GetMapping("/answer")
	public void answer(@RequestParam("parentSellerBno") Long parentSellerBno, Model model) {
		
		model.addAttribute("sellerBoard", service.get(parentSellerBno));
		
	}
	
	@PostMapping("/answer")
	public String answer(SellerBoardVO sellerboard, RedirectAttributes rttr) {
		
		service.insertAnswerSelectKey(sellerboard);
		
		rttr.addFlashAttribute("sellerBoardAnswerResult", sellerboard.getParentSellerBno());
		
		return "redirect:/sellerBoard/list";
		
	}
	
	@PostMapping("/modify")
	public String modify(SellerBoardVO sellerBoard, RedirectAttributes rttr) {
		
		log.info("modify : " + sellerBoard);
		
		if(service.modify(sellerBoard)) {
			rttr.addFlashAttribute("SellerBoardModifyresult", "success");
		}
		
		return "redirect:/sellerBoard/list";
	}	
	
	@PostMapping("/remove")
	public String remove(@RequestParam("sellerBno") Long sellerBno, RedirectAttributes rttr) {
		
		log.info("remove..." + sellerBno);
		
		if(service.remove(sellerBno)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		return "redirect:sellerBoard/list";
	}
	
	
}
