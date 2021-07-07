package org.wine.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.wine.domain.CartVO;
import org.wine.domain.UserVO;
import org.wine.service.CartService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/cart/*")
@AllArgsConstructor
public class CartController {

	private CartService service;

	@RequestMapping("/list")
	public ModelAndView list(HttpSession session, ModelAndView mav) {

		UserVO lvo =  (UserVO) session.getAttribute("user");
        long userNum=lvo.getUserNum();
		/* userNum = (long) 1; */

		Map<String, Object> map = new HashMap<String, Object>();
		List<CartVO> list = service.listCart(userNum);
		int sumTotalPrice = service.sumTotalPrice(userNum);
		map.put("list", list);
		map.put("count", list.size());
		map.put("sumTotalPrice", sumTotalPrice);
		mav.setViewName("cart/list");
		mav.addObject("map", map);
		return mav;

	}

	// 목록
	/*
	 * @GetMapping("/list") public void listgettest() { log.info("카트 리스트 페이지 테스트"); }
	 */

	// 추가
	
	  @RequestMapping("/insert")
	  public String insert(@ModelAttribute CartVO cartvo,
			  @RequestParam("userNum") Long userNum, 
			  @RequestParam("sellerNum") Long sellerNum) {
	 
		/* Long userNum=(Long)session.getAttribute("userNum"); */
	      cartvo.setUserNum(userNum); 
	      cartvo.setSellerNum(sellerNum); 
	      int count = service.countCart(cartvo);
	      log.info(cartvo);
	  if(count == 0) { 
		  service.insert(cartvo);
		  }
	  else { service.updateCart(cartvo);
	  }
	  
	  return "redirect:/cart/list"; 
	  }
	 

	// 장바구니 삭제
	@RequestMapping("/delete")
	public String delete(@RequestParam Long cartNum) {
		service.delete(cartNum);
		return "redirect:/cart/list";

	}

	// 동일한 상품 장바구니에 추가한 경우 수량 업데이트
	@RequestMapping("/update")
	public String update(@RequestParam int[] cartQty, @RequestParam Long[] wineNum, HttpSession session) {

		// 세션 유저넘버 불러오기
		Long userNum = (Long) session.getAttribute("userNum");
		
		userNum = (long) 1;

		for (int i = 0; i < wineNum.length; i++) {

			CartVO cartvo = new CartVO();
			cartvo.setUserNum(userNum);
			cartvo.setCartQty(cartQty[i]);
			cartvo.setWineNum(wineNum[i]);
			service.modifyCart(cartvo);
		}
		return "redirect:/cart/list";

	}
	
	@RequestMapping("/modifyCart")
	public String modifyCart(@ModelAttribute("cartvo") CartVO cartvo) {
		log.info("cartVO===" + cartvo);
		int cartQty = cartvo.getCartQty();
		Long cartNum = cartvo.getCartNum();
		
		if(cartQty == 0) {
			service.delete(cartNum);
		}else if(cartQty > 0) {
			service.modifyCart(cartvo);
		}
		return "redirect:/cart/list";
		}
	}
	
