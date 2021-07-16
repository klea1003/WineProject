package org.wine.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.wine.domain.UserVO;
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

		UserVO user = (UserVO) session.getAttribute("user");
        Long userNum = user.getUserNum();
		
        List<WishListVO> list = service.listWish(userNum);

		Map<String, Object> map = new HashMap<String, Object>();		
		map.put("list", list); 
		 log.info(list);
		map.put("count", list.size()); 
		mav.setViewName("wishList/list");
		mav.addObject("map", map);
		return mav;

	}

	// 추가
	@RequestMapping("/insert")
	public String insert(
			@RequestParam("wno")Long wno, 
			HttpSession session, 
			RedirectAttributes rttr
	) {
        
		log.info("wishList...insert");
        UserVO user = (UserVO) session.getAttribute("user");
        Long userNum = user.getUserNum();
        
        WishListVO wishItem = new WishListVO();
        
        wishItem.setUserNum(userNum); 
        wishItem.setWineNum(wno); 
		
		int count = service.countWish(wishItem);

		if (count == 0) {
			service.insert(wishItem);
			rttr.addFlashAttribute("wineNum", wno);
		}
		
		return "redirect:/wishList/list";
		
	}


	// 장바구니 삭제
	@RequestMapping("/delete")
	public String delete(@RequestParam Long wishNum) {
		service.delete(wishNum);
		return "redirect:/wishList/list";

	}
}

