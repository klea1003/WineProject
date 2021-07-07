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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.wine.domain.CartVO;
import org.wine.domain.OrderDetailVO;
import org.wine.domain.OrderListVO;
import org.wine.domain.OrderVO;
import org.wine.domain.SellerVO;
import org.wine.domain.UserVO;
import org.wine.domain.pageDTO;
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


	// 주문
	@RequestMapping(value = "/ordering", method = RequestMethod.GET)
	public void orderPage(Model model) throws Exception {
		log.info("ordering");
		Long userNum = 1L;
		List<CartVO> list = cartService.listCart(userNum);

		log.info(list);
		model.addAttribute("list", list);
	}
	
	
	

	// 주문
		@RequestMapping(value = "/ordering", method = RequestMethod.POST)
		public String order1(HttpSession session, OrderVO order, 
				OrderDetailVO orderDetail) throws Exception {
			log.info("order");
			
			//UserVO user = (UserVO)session.getAttribute("userNum"); 
			//Long userNum = user.getUserNum();
			
			  Long userNum = (Long) session.getAttribute("userNum");
	  
			 userNum = (long) 1;
			 
			Calendar cal = Calendar.getInstance();
			int year = cal.get(Calendar.YEAR);
			String ym = year + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
			String ymd = ym +  new DecimalFormat("00").format(cal.get(Calendar.DATE));
			String subNum = "";

			for(int i = 1; i <= 6; i ++) {
				subNum += (int)(Math.random() * 10);
			}

			String orderNum = ymd + "_" + subNum;


			order.setOrderNum(orderNum);
			order.setUserNum(userNum);
			
		

			service.orderInfo(order);	 
			service.orderInfo_Detail(order);
			service.cartAllDelete(userNum);
		
	
           log.info(order);
			return "redirect:/order/orderList";  

		}


	//주문 목록
	@RequestMapping(value= "/orderList", method= RequestMethod.GET)	
	public void getOrderSuccessList(HttpSession session, OrderVO order, Model model)throws Exception{
		log.info("get order  List");
		 
		//UserVO user = (UserVO)session.getAttribute("userNum");
		//Long userNum = user.getUserNum();
		Long userNum = (Long) session.getAttribute("userNum");
		userNum = (long) 1;

		order.setUserNum(userNum);
		List<OrderListVO> orderList = service.orderList(order);
		
		
		for(int i=0;i<orderList.size();i++) {
			String num = orderList.get(i).getOrderNum();
			orderList.get(i).setPickUpName(service.orderSellerList(num).getPickUpName());
			orderList.get(i).setSellerId(service.orderSellerList(num).getSellerId());
		}
		log.info(orderList);
		
		model.addAttribute("orderList",orderList);
	
		
		
	}


	//특정 주문 상세 목록
	@RequestMapping(value = "/orderView", method = RequestMethod.GET)
	public void getOrderList(HttpSession session,
			@RequestParam("n") String orderNum,
			OrderVO order, Model model) throws Exception {
		log.info("get order view");

		//UserVO user = (UserVO)session.getAttribute("userNum");
		//Long userNum = user.getUserNum();
		Long userNum = (Long) session.getAttribute("userNum");
		userNum = (long) 1;

		order.setUserNum(userNum);
		order.setOrderNum(orderNum);
        
		
		List<OrderListVO> orderView = service.orderView(order);
		
		
		int sum=0;
		for(int i=0;i<orderView.size();i++) {
			sum += orderView.get(i).getTotalPrice();
			orderView.get(i).setSellerId(service.orderSellerList(orderNum).getSellerId());
			orderView.get(i).setSellerNum(service.orderSellerList(orderNum).getSellerNum());
		}
		

		
		model.addAttribute("orderView", orderView);
		model.addAttribute("sum", sum);
	}

}