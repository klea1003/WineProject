package org.wine.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.wine.domain.WishListVO;
import org.wine.service.WishListService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/wishList/*")
@AllArgsConstructor
public class WishListController {

	private WishListService service;

	@RequestMapping("/list")
	public ModelAndView list(HttpSession session, ModelAndView mav) {

		Long userNum = (Long) session.getAttribute("userNum");

		userNum = (long) 1;

		Map<String, Object> map = new HashMap<String, Object>();
		List<WishListVO> list = service.listWish(userNum);
		map.put("list", list); //리스트
		map.put("count", list.size()); //상품 유무
		mav.setViewName("wishList/list");
		mav.addObject("map", map);
		return mav;

	}

	// 추가
	@RequestMapping("/insert")
	public String insert(@RequestParam("wno")Long wno, HttpSession session) {
        log.info("wishList...insert");
		Long userNum = (Long) session.getAttribute("userNum");

		userNum = (long) 1;
        WishListVO wishList = new WishListVO();
        
		wishList.setUserNum(userNum); 
		wishList.setWineNum(wno); 
		int count = service.countWish(wishList);

		if(count == 0) { service.insert(wishList);
		}else {
		
		} 
		log.info(wishList);
		return "redirect:/wishList/list"; 
		}


	// 장바구니 삭제
	@RequestMapping("/delete")
	public String delete(@RequestParam Long wishNum) {
		service.delete(wishNum);
		return "redirect:/wishList/list";

	}
}

