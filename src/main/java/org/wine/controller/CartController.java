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
import org.wine.domain.CartDisplayVO;
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

		UserVO user = (UserVO) session.getAttribute("user");
		long userNum = user.getUserNum();

		List<CartDisplayVO> list = service.getList(userNum);
		int totalPrice = service.getTotalPrice(userNum);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("count", list.size());
		map.put("sumTotalPrice", totalPrice);
		
		mav.setViewName("cart/list");
		mav.addObject("map", map);
		return mav;
	}

	@RequestMapping("/insert")
	public String insert(@ModelAttribute CartVO cartVo, HttpSession session) {
		
		UserVO user = (UserVO) session.getAttribute("user");
        Long userNum = user.getUserNum();
        
        cartVo.setUserNum(userNum);	// session의 userNum 사용
        
        log.info(cartVo);
        
        service.addWine(cartVo);
        
		return "redirect:/cart/list";
	}

	// 장바구니 삭제
	@RequestMapping("/delete")
	public String delete(@RequestParam Long cartNum) {
		service.deleteCart(cartNum);
		return "redirect:/cart/list";
	}

	// 동일한 상품 장바구니에 추가한 경우 수량 업데이트
	@GetMapping("/update")
	public String update(
			@RequestParam(value="wineNum[]", required=false)List<Long> wineNum,
			@RequestParam(value="wineQty[]", required=false)List<Integer> wineQty,
			HttpSession session
	) {

		UserVO user = (UserVO) session.getAttribute("user");
        Long userNum = user.getUserNum();
        
        int length = wineNum.size();
        
        for(int i=0; i<length; i++) {
        	CartVO cartVo = new CartVO();
        	
        	cartVo.setUserNum(userNum);
        	cartVo.setWineNum(wineNum.get(i));
        	cartVo.setWineQty(wineQty.get(i));
        	
        	service.modifyCart(cartVo);
        }

		return "redirect:/cart/list";

	}
	
	@GetMapping("/deleteItems")
	public String delete(@RequestParam(value="deleteCartArr[]")List<Long> deleteCartArr) {
		log.info(deleteCartArr);
		
		for (Long cartNum : deleteCartArr) {
			service.deleteCart(cartNum);
		}
		return "redirect:/cart/list";
	}

	@RequestMapping("/modifyCart")
	public String modifyCart(@ModelAttribute("cartvo") CartVO cartvo) {
		log.info("cartVO===" + cartvo);
		int cartQty = cartvo.getWineQty();
		Long cartNum = cartvo.getCartNum();

		if (cartQty == 0) {
			service.deleteCart(cartNum);
		} else if (cartQty > 0) {
			service.modifyCart(cartvo);
		}
		return "redirect:/cart/list";
	}
}
