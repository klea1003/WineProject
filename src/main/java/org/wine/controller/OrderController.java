package org.wine.controller;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.wine.domain.CartDisplayVO;
import org.wine.domain.OrderItemVO;
import org.wine.domain.OrderVO;
import org.wine.domain.UserVO;
import org.wine.service.CartService;
import org.wine.service.OrderService;
import org.wine.service.SellerService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/order/*")
@AllArgsConstructor
public class OrderController {
	
	private OrderService service;
	private CartService cartService;
	private SellerService sellerService;
	
	@GetMapping("/order")
	public ModelAndView order(
			HttpSession session, 
			@RequestParam(value="cartNumArr") List<Long> cartNumArr,
			ModelAndView mav
	) throws Exception {
		// wineCartArr 를 받고 주문 상세 내역을 내보낸다.
		// seller list를 내보낸다.
		
		UserVO user = (UserVO)session.getAttribute("user"); 
		Long userNum = user.getUserNum();
		
		List<CartDisplayVO> list = cartService.getList(userNum);
		List<CartDisplayVO> ret_list = new ArrayList<CartDisplayVO>();
		
		for(CartDisplayVO cart: list) {
			if(cartNumArr.contains(cart.getCartNum()) == true) {
				ret_list.add(cart);
			}
		}
		
		int totalPrice = 0;
		for(CartDisplayVO cart: list) {
			totalPrice += cart.getTotalPrice();
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", ret_list);
		map.put("sellerList", sellerService.getList());
		map.put("count", ret_list.size());
		map.put("sumTotalPrice", totalPrice);
		
		mav.setViewName("/order/order");
		mav.addObject("map", map);
		
		return mav;
	}
	
	@RequestMapping(value = "/complete", method = RequestMethod.GET)
	public String complete(HttpSession session, OrderVO order, 
			@RequestParam(value="cartNumArr") ArrayList<Long> cartNumArr
	) throws Exception {
		log.info("order complete");
		log.info("cartNumArr: " + cartNumArr);
		log.info("cartNumArr: " + cartNumArr.get(0));
		
		UserVO user = (UserVO)session.getAttribute("user"); 
		Long userNum = user.getUserNum();
		
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		String ym = year + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
		String ymd = ym +  new DecimalFormat("00").format(cal.get(Calendar.DATE));
		String subNum = "";

		for(int i = 1; i <= 6; i ++) {
			subNum += (int)(Math.random() * 10);
		}

		String orderName = ymd + "_" + subNum;
		
		Long orderNum = service.getNextOrderNum();
		
		order.setOrderNum(orderNum);
		order.setOrderName(orderName);
		order.setUserNum(userNum);
		
		log.info(order);
		service.insertOrder(order);
		
		Long cartNum;
		for(CartDisplayVO cart: cartService.getList(userNum)) {
			
			cartNum = cart.getCartNum();
			
			if (cartNumArr.contains(cartNum) == true) {
				OrderItemVO orderItem = new OrderItemVO();
				
				orderItem.setOrderNum(orderNum);
				orderItem.setWineNum(cart.getWineNum());
				orderItem.setWineQty(cart.getWineQty());
				
				log.info("orderItem: " + orderItem);
				
				service.insertOrderItem(orderItem);
				
				cartService.deleteCart(cartNum);
			}

		}		
		
		return "redirect:/order/list";
	}
	
	@RequestMapping(value= "/list", method= RequestMethod.GET)	
	public void getOrderSuccessList(HttpSession session, Model model) throws Exception{
		log.info("get order  List");
		 
		UserVO user = (UserVO)session.getAttribute("user"); 
		Long userNum = user.getUserNum();

		List<OrderVO> orderList = service.getOrderList(userNum);
		
		model.addAttribute("orderList", orderList);
		
	}

	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String getOrderList(HttpSession session,
			@RequestParam("n") String orderNum, Model model) throws Exception {
		log.info("get order view");
		
		Long order = Long.parseLong(orderNum);

		UserVO user = (UserVO)session.getAttribute("user"); 
		Long userNum = user.getUserNum();

		log.info(service.getOrder(order));
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("order", service.getOrder(order));
		map.put("items", service.getOrderItemList(order));
		
		model.addAttribute("map", map);
		return "/order/detail";  
	}

}