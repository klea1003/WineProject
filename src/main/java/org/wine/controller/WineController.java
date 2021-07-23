package org.wine.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.wine.domain.BoardLikeVO;
import org.wine.domain.CriteriaReview;
import org.wine.domain.CriteriaWine;
import org.wine.domain.ReviewPageDTO;
import org.wine.domain.ReviewVO;
import org.wine.domain.SocialCriteriaReview;
import org.wine.domain.SocialPageDTO;
import org.wine.domain.UserVO;
import org.wine.domain.WineVO;
import org.wine.domain.pageWineDTO;
import org.wine.service.ReviewService;
import org.wine.service.WineService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/wine/*")
@AllArgsConstructor
public class WineController {

	private WineService service;
	private ReviewService reviewSerivce;
	
	@GetMapping("/main")
	public void main(
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
	
	@GetMapping("/list")
	public void list(
			CriteriaWine cri,
			@RequestParam(value="wine_type_ids", required=false)ArrayList<Integer> wineTypeIds,
			@RequestParam(value="wine_grape_ids", required=false)ArrayList<Integer> wineGrapeIds,
			@RequestParam(value="wine_region_ids", required=false)ArrayList<Integer> wineRegionIds,
			@RequestParam(value="wine_country_ids", required=false)ArrayList<Integer> wineCountryIds,
			@RequestParam(value="wine_style_ids", required=false)ArrayList<Integer> wineStyleIds,
			@RequestParam(value="keyword", required=false) String wineKeyword,
			@RequestParam(value="wine_price_min", required=false) String winePriceMin,
			@RequestParam(value="wine_price_max", required=false) String winePriceMax,			
			@RequestParam(value="rating", required=false) String wineRating,
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
		
		log.info("wineRating: " + wineRating);
		if (wineRating == null) {
			model.addAttribute("wine_rating", 5);
		} else {
			model.addAttribute("wine_rating", Integer.parseInt(wineRating));
		}
		
		log.info("winePriceMin: " + winePriceMin);
		if (winePriceMin == null) {
			model.addAttribute("winePriceMin", 10000);
		} else {
			model.addAttribute("winePriceMin", Integer.parseInt(winePriceMin));
		}
		
		log.info("winePriceMax: " + winePriceMax);
		if (winePriceMax == null) {
			model.addAttribute("winePriceMax", 200000);
		} else {
			model.addAttribute("winePriceMax", Integer.parseInt(winePriceMax));
		}
		
		int total = service.getTotal(cri);		
		log.info("total:" + total); 
		
		model.addAttribute("pageMaker",new pageWineDTO(cri,total)); 		
	}
	
	@GetMapping("/search")
	public void search(
			CriteriaWine cri,
			@RequestParam(value="wine_type_ids", required=false)ArrayList<Integer> wineTypeIds,
			@RequestParam(value="wine_grape_ids", required=false)ArrayList<Integer> wineGrapeIds,
			@RequestParam(value="wine_region_ids", required=false)ArrayList<Integer> wineRegionIds,
			@RequestParam(value="wine_country_ids", required=false)ArrayList<Integer> wineCountryIds,
			@RequestParam(value="wine_style_ids", required=false)ArrayList<Integer> wineStyleIds,
			@RequestParam(value="keyword", required=false) String wineKeyword,
			@RequestParam(value="wine_price_min", required=false) String winePriceMin,
			@RequestParam(value="wine_price_max", required=false) String winePriceMax,			
			@RequestParam(value="rating", required=false) String wineRating,
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
		
		log.info("wineRating: " + wineRating);
		if (wineRating == null) {
			model.addAttribute("wine_rating", 5);
		} else {
			model.addAttribute("wine_rating", Integer.parseInt(wineRating));
		}
		
		log.info("winePriceMin: " + winePriceMin);
		if (winePriceMin == null) {
			model.addAttribute("winePriceMin", 10000);
		} else {
			model.addAttribute("winePriceMin", Integer.parseInt(winePriceMin));
		}
		
		log.info("winePriceMax: " + winePriceMax);
		if (winePriceMax == null) {
			model.addAttribute("winePriceMax", 200000);
		} else {
			model.addAttribute("winePriceMax", Integer.parseInt(winePriceMax));
		}
		
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
			@RequestParam(value="wineRating", required=false) String wineRating,
			@RequestParam(value="priceMin") String winePriceMin,
			@RequestParam(value="priceMax") String winePriceMax,
			@RequestParam(value="wineKeyword", required=false) String wineKeyword
			) {
		
		CriteriaWine cri = new CriteriaWine();
		
		log.info("requestWineList pageNum: "  + pageNum);
		log.info("requestWineList wineTypeArr: " + wineTypeArr);
		log.info("requestWineList wineGrapeArr: " + wineGrapeArr);
		log.info("requestWineList wineRegionArr: " + wineRegionArr);
		log.info("requestWineList wineCountryArr: " + wineCountryArr);
		log.info("requestWineList wineStyleArr: " + wineStyleArr);
		log.info("requestWineList wineRating: " + wineRating);
		log.info("requestWineList priceMin: " + winePriceMin);
		log.info("requestWineList priceMax: " + winePriceMax);
		log.info("requestWineList wineKeyword: " + wineKeyword);
		
		int wineRatingInt = 5;
		if (wineRating == null) {
			wineRatingInt = 5;
		} else {
			wineRatingInt = Integer.parseInt(wineRating);
		}
		
		cri.setPageNum(pageNum);
		cri.setWineTypeArr(wineTypeArr);
		cri.setWineGrapeArr(wineGrapeArr);
		cri.setWineRegionArr(wineRegionArr);
		cri.setWineCountryArr(wineCountryArr);
		cri.setWineStyleArr(wineStyleArr);
		cri.setWineRating(wineRatingInt);
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
			@RequestParam(value="wineRating", required=false) String wineRating,
			@RequestParam(value= "priceMin") String winePriceMin,
			@RequestParam(value= "priceMax") String winePriceMax,
			@RequestParam(value="wineKeyword", required=false) String wineKeyword
			) {
		
		CriteriaWine cri = new CriteriaWine();
		
		log.info("getTotalPageNum valueArr: " + wineTypeArr);
		log.info("getTotalPageNum valueArr: " + wineGrapeArr);
		log.info("getTotalPageNum valueArr: " + wineRegionArr);
		log.info("getTotalPageNum valueArr: " + wineCountryArr);
		log.info("getTotalPageNum valueArr: " + wineStyleArr);
		log.info("getTotalPageNum valueArr: " + wineRating);
		log.info("getTotalPageNum priceMin: " + winePriceMin);
		log.info("getTotalPageNum priceMax: " + winePriceMax);
		log.info("getTotalPageNum wineKeyword: " + wineKeyword);
		
		int wineRatingInt = 5;
		if (wineRating == null) {
			wineRatingInt = 5;
		} else {
			wineRatingInt = Integer.parseInt(wineRating);
		}
		
		cri.setWineTypeArr(wineTypeArr);
		cri.setWineGrapeArr(wineGrapeArr);
		cri.setWineRegionArr(wineRegionArr);
		cri.setWineCountryArr(wineCountryArr);
		cri.setWineStyleArr(wineStyleArr);
		cri.setWineRating(wineRatingInt);
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
	public void get(@RequestParam("wno") Long wno, Model model, CriteriaReview cri,HttpServletRequest request) {
		
		log.info("/get");
		model.addAttribute("wine", service.get(wno));
		 ReviewVO re=new ReviewVO();
		 ArrayList<ReviewVO> myList= null;
		 HttpSession session = request.getSession();
		 UserVO lvo = (UserVO) session.getAttribute("user");
		if(lvo!=null) {
		 re.setUserNum(lvo.getUserNum());
		 re.setWineNum(wno);
		 myList = reviewSerivce.getMyList(re);
		}
		cri.setWineNum(wno.intValue());
		
		int total = reviewSerivce.getTotal(wno);
		
		CriteriaReview cri3Line = new CriteriaReview();
		cri3Line.setWineNum(wno.intValue());
		cri3Line.setAmount(3);		

		model.addAttribute("myList",myList);
		model.addAttribute("pageReviewMaker",new ReviewPageDTO(cri,total));
		model.addAttribute("review_list_3line", reviewSerivce.getList(cri3Line));
		model.addAttribute("review_Rating", reviewSerivce.getRating(wno));
		model.addAttribute("review_Avg", reviewSerivce.getAvgRating(wno));
		model.addAttribute("taste_list", service.getTasteList(wno));
		model.addAttribute("list_same_winery", service.getListSameWinery(wno));
		
	}
	
	@PostMapping("/clickLike")
	public String clickLike(ReviewVO review) {
		log.info("clickLike : " + review.getReviewNum());
		reviewSerivce.clickLike(review);
		
		 return "redirect:/wine/get?wno="+review.getWineNum(); 
	}
	
	
	
	
	
}
