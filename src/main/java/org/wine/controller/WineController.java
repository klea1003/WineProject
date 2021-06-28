package org.wine.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.wine.domain.CriteriaWine;
import org.wine.domain.WineVO;
import org.wine.domain.pageWineDTO;
import org.wine.service.WineService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/wine/*")
@AllArgsConstructor
public class WineController {

	private WineService service;
	
	@GetMapping("/list")
	public void list(CriteriaWine cri, Model model) {
		log.info("list"+ cri);
		
		model.addAttribute("list", service.getList(cri));
		
		int total = service.getTotal(cri);
		
		log.info("total:" + total); 
		
		model.addAttribute("pageMaker",new pageWineDTO(cri,total)); 		
	}
	
	@GetMapping(value = "/requestWineList")
	public ResponseEntity<List<WineVO>> checkWineTypeArr(
			@RequestParam(value="pageNum") int pageNum, 
			@RequestParam(value= "wineTypeArr[]", required=false) ArrayList<String> valueArr
			) {
		
		CriteriaWine cri = new CriteriaWine();
		
		log.info("requestWineList pageNum: " + pageNum);
		log.info("requestWineList valueArr: " + valueArr);
		
		cri.setPageNum(pageNum);
		cri.setWineTypeArr(valueArr);
		
		ResponseEntity<List<WineVO>> result = null;
		result = ResponseEntity.status(HttpStatus.OK).body(service.getList(cri));
		
		return result;
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
