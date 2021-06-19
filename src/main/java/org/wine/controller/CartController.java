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
		
		Long userNum = (Long) session.getAttribute("userNum");
		Map<String, Object> map = new HashMap<String, Object>();
		List<CartVO> list =service.listCart(userNum);
		int sumTotalPrice = service.sumTotalPrice(userNum);
		map.put("list", list);
		map.put("count", list.size());
		map.put("sumTotalPrice", sumTotalPrice);
		mav.setViewName("cart/list");
		mav.addObject("map", map);
		return mav;
		
	}
	//목록
//	@GetMapping("/list")
//	public void listgettest() {
//		log.info("카트 리슽츠  페이지");
//	}
	
	
//	@RequestMapping("/list")
//    public ModelAndView list(ModelAndView mav, HttpSession session) {
//        Map<String, Object> map=new HashMap<>();
//                
//
//        Long userNum=(Long)session.getAttribute("userNum");
//
//        if(userNum!=null) { 
//            //로그인한 상태이면 실행
//            List<CartVO> list=service.listCart(userNum);//장바구니 목록
//            int sumTotalPrice = service.sumTotalPrice(userNum);
//          
//            map.put("sumTotalPrice", sumTotalPrice);
//            map.put("list", list); //장바구니 목록
//            map.put("count", list.size()); //레코드 갯수
//
//            mav.setViewName("shop/cart_list"); //이동할 페이지의 이름
//            mav.addObject("map", map); //데이터 저장
//
//            return mav; //화면 이동
//
//        }else { //로그인하지 않은 상태
//
//            return new ModelAndView("user/login", "", null);
//            //로그인을 하지 않았으면 로그인 페이지로 이동시킨다.
//        }
//    }
	
	
	
	//추가
	@RequestMapping("/insert")

    public String insert(@ModelAttribute CartVO cartvo, 
            HttpSession session) {

        Long userNum=(Long)session.getAttribute("userNum");
       
        cartvo.setUserNum(userNum);
        int count = service.countCart(cartvo.getSellerNum(), cartvo.getWineNum(), userNum);
      
        if(count == 0) {
        	service.insert(cartvo);
        }else {
        	service.updateCart(cartvo);
        }
        return "redirect:/cart/list";
	}


	
	//장바구니 삭제
	@RequestMapping("/delete")
	public String delete(@RequestParam Long cartNum) {
		service.delete(cartNum);
		return "redirect:/cart/list";

	}
	
	//수정
	@RequestMapping("/update")
	public String update(@RequestParam int[] cartQty, @RequestParam Long[]wineNum, HttpSession session ) {
	
		//세션 유저넘버 불러오기
		Long userNum = (Long) session.getAttribute("userNum");
		
		for(int i=0; i<wineNum.length; i++) {
		
			CartVO cartvo = new CartVO();
			cartvo.setUserNum(userNum);
			cartvo.setCartQty(cartQty[i]);
			cartvo.setWineNum(wineNum[i]);
			service.modifyCart(cartvo);
	}
		return "redirect:/cart/list";

}

//


//
}