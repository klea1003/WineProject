package org.wine.controller;

import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.wine.domain.OrderDetailVO;
import org.wine.domain.OrderListVO;
import org.wine.domain.OrderVO;
import org.wine.domain.UserVO;
import org.wine.service.CartService;
import org.wine.service.OrderService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/order/*")
@AllArgsConstructor
public class OrderController {

	private OrderService service;
	private CartService cartService;
	
	@RequestMapping(value="/orderList", method = RequestMethod.POST)
	public void order(HttpSession sesssion, OrderVO order, OrderDetailVO orderDetail) throws Exception{
		log.info("order");
		
		
//		 UserVO user = (UserVO) session.getAttribute("user");
//		 Long userNum =  user.getUSER_NUM();

		
		service.orderInfo(order);
		service.orderInfo_Detail(orderDetail);
	}
	
	
	// 주문
	@RequestMapping(value = "/ordering", method = RequestMethod.POST)
	public String order1(HttpSession session, OrderVO order, OrderDetailVO orderDetail) throws Exception {
	 log.info("order");
	 
	 UserVO user = (UserVO)session.getAttribute("user");  
	Long userNum = user.getUserNum();
	userNum = (long) 1;
	 
	 Calendar cal = Calendar.getInstance();
	 int year = cal.get(Calendar.YEAR);
	 String ym = year + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
	 String ymd = ym +  new DecimalFormat("00").format(cal.get(Calendar.DATE));
	 String subNum = "";
	 
	 for(int i = 1; i <= 6; i ++) {
	  subNum += (int)(Math.random() * 10);
	 }
	 
	 long OrderNum = 1L;
     String str = String.valueOf(OrderNum);
	String orderNum = ymd + "_" + subNum;
	 
	 order.setOrderNum(OrderNum);
	 order.setUserNum(userNum);
	  
	 service.orderInfo(order);
	 
	 orderDetail.setOrderNum(OrderNum);   
	 service.orderInfo_Detail(orderDetail);
	 
	 service.cartAllDelete(userNum);
	 
	 return "redirect:/order/orderList";  
	
}
	
	
	//주문 목록
	@RequestMapping(value= "/orderList", method= RequestMethod.GET)	
		public void getOrderSuccessList(HttpSession session, OrderVO order, Model model)throws Exception{
			log.info("get order  List");
			
			UserVO user = (UserVO)session.getAttribute("user");
			Long userNum = user.getUserNum();
			userNum = (long) 1;
			
			order.setUserNum(userNum);
			List<OrderVO> orderList = service.orderList(order);
			
			model.addAttribute("orderList",orderList);
		}
	
	
	//특정 주문 상세 목록
	@RequestMapping(value = "/orderView", method = RequestMethod.GET)
	public void getOrderList(HttpSession session,
	      @RequestParam("n") Long orderNum,
	      OrderVO order, Model model) throws Exception {
	 log.info("get order view");
	 
	 UserVO user = (UserVO)session.getAttribute("user");
	 Long userNum = user.getUserNum();
		userNum = (long) 1;
	 
	 order.setUserNum(userNum);
	 order.setOrderNum(orderNum);
	 
	 List<OrderListVO> orderView = service.orderView(order);
	 
	 model.addAttribute("orderView", orderView);
	}

}