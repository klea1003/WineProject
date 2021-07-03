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
	public void list(
			CriteriaWine cri,
			@RequestParam(value="wine_type_ids", required=false)ArrayList<Integer> wineTypeIds,
			@RequestParam(value="wine_grape_ids", required=false)ArrayList<Integer> wineGrapeIds,
			@RequestParam(value="wine_region_ids", required=false)ArrayList<Integer> wineRegionIds,
			@RequestParam(value="wine_country_ids", required=false)ArrayList<Integer> wineCountryIds,
			@RequestParam(value="wine_style_ids", required=false)ArrayList<Integer> wineStyleIds,
			@RequestParam(value="keyword", required=false) String wineKeyword,
			Model model
		) {
		
		log.info("wineTypeIds: " + wineTypeIds);
		model.addAttribute("wineTypeList", service.getWinPropertyDTO("wine_type", wineTypeIds));
		
		log.info("wineGrapeIds: " + wineGrapeIds);
		model.addAttribute("wineGrapeList", service.getWinPropertyDTO("wine_grape", wineGrapeIds));
		
		log.info("wineRegionIds: " + wineRegionIds);
		model.addAttribute("wineRegionList", service.getWinPropertyDTO("wine_region", wineRegionIds));
		
		log.info("wineCountryIds: " + wineCountryIds);
		model.addAttribute("wineCountryList", service.getWinPropertyDTO("wine_country", wineCountryIds));
		
		log.info("wineStyleIds: " + wineStyleIds);
		model.addAttribute("wineStyleList", service.getWinPropertyDTO("wine_style", wineStyleIds));
		
		log.info("wineKeyword: " + wineKeyword);
		model.addAttribute("wine_keyword", wineKeyword);
		
		int total = service.getTotal(cri);		
		log.info("total:" + total); 
		
		model.addAttribute("pageMaker",new pageWineDTO(cri,total)); 		
	}
	
	@GetMapping(value = "/requestWineList")
	public ResponseEntity<List<WineVO>> getWineList(
			@RequestParam(value="pageNum") int pageNum, 
			@RequestParam(value="wineTypeArr[]", required=false) ArrayList<String> wineTypeArr,
			@RequestParam(value="wineGrapeArr[]", required=false) ArrayList<String> wineGrapeArr,
			@RequestParam(value="wineRegionArr[]", required=false) ArrayList<String> wineRegionArr,
			@RequestParam(value="wineCountryArr[]", required=false) ArrayList<String> wineCountryArr,
			@RequestParam(value="wineStyleArr[]", required=false) ArrayList<String> wineStyleArr,
			@RequestParam(value="wineRatingArr[]", required=false) ArrayList<String> wineRatingArr,
			@RequestParam(value="priceMin") String winePriceMin,
			@RequestParam(value="priceMax") String winePriceMax,
			@RequestParam(value="wineKeyword") String wineKeyword
			) {
		
		CriteriaWine cri = new CriteriaWine();
		
		log.info("requestWineList pageNum: "  + pageNum);
		log.info("requestWineList wineTypeArr: " + wineTypeArr);
		log.info("requestWineList wineGrapeArr: " + wineGrapeArr);
		log.info("requestWineList wineRegionArr: " + wineRegionArr);
		log.info("requestWineList wineCountryArr: " + wineCountryArr);
		log.info("requestWineList wineStyleArr: " + wineStyleArr);
		log.info("requestWineList wineRatingArr: " + wineRatingArr);
		log.info("requestWineList priceMin: " + winePriceMin);
		log.info("requestWineList priceMax: " + winePriceMax);
		log.info("requestWineList wineKeyword: " + wineKeyword);
		
		cri.setPageNum(pageNum);
		cri.setWineTypeArr(wineTypeArr);
		cri.setWineGrapeArr(wineGrapeArr);
		cri.setWineRegionArr(wineRegionArr);
		cri.setWineCountryArr(wineCountryArr);
		cri.setWineStyleArr(wineStyleArr);
		cri.setWineStyleArr(wineRatingArr);
		cri.setWinePriceRange(Integer.parseInt(winePriceMin), Integer.parseInt(winePriceMax));
		cri.setKeyword(wineKeyword);
		
		ResponseEntity<List<WineVO>> result = null;
		result = ResponseEntity.status(HttpStatus.OK).body(service.getList(cri));
		
		return result;
	}
	
	@GetMapping(value = "/getTotalPageNum")
	public ResponseEntity<pageWineDTO> getTotalPageNum(
			@RequestParam(value= "wineTypeArr[]", required=false) ArrayList<String> wineTypeArr,
			@RequestParam(value= "wineGrapeArr[]", required=false) ArrayList<String> wineGrapeArr,
			@RequestParam(value= "wineRegionArr[]",required=false) ArrayList<String> wineRegionArr,
			@RequestParam(value= "wineCountryArr[]", required=false) ArrayList<String> wineCountryArr,
			@RequestParam(value= "wineStyleArr[]", required=false) ArrayList<String> wineStyleArr,
			@RequestParam(value= "wineRatingArr[]", required=false) ArrayList<String> wineRatingArr,
			@RequestParam(value= "priceMin") String winePriceMin,
			@RequestParam(value= "priceMax") String winePriceMax,
			@RequestParam(value="wineKeyword") String wineKeyword
			) {
		
		CriteriaWine cri = new CriteriaWine();
		
		log.info("requestWineList valueArr: " + wineTypeArr);
		log.info("requestWineList valueArr: " + wineGrapeArr);
		log.info("requestWineList valueArr: " + wineRegionArr);
		log.info("requestWineList valueArr: " + wineCountryArr);
		log.info("requestWineList valueArr: " + wineStyleArr);
		log.info("requestWineList valueArr: " + wineRatingArr);
		log.info("requestWineList priceMin: " + winePriceMin);
		log.info("requestWineList priceMax: " + winePriceMax);
		log.info("requestWineList wineKeyword: " + wineKeyword);
		
		cri.setWineTypeArr(wineTypeArr);
		cri.setWineGrapeArr(wineGrapeArr);
		cri.setWineRegionArr(wineRegionArr);
		cri.setWineCountryArr(wineCountryArr);
		cri.setWineStyleArr(wineStyleArr);
		cri.setWinePriceRange(Integer.parseInt(winePriceMin), Integer.parseInt(winePriceMax));
		cri.setKeyword(wineKeyword);
		
		int total = service.getTotal(cri);
		log.info("total:" + total);
		log.info(new pageWineDTO(cri,total));
		
		
		ResponseEntity<pageWineDTO> result = null;
		result = ResponseEntity.status(HttpStatus.OK).body(new pageWineDTO(cri,total));
		
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
