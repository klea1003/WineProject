package org.wine.controller;

import java.util.List;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.JavaMailSender;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.wine.domain.ProfileVO;
import org.wine.domain.SocialCriteriaReview;
import org.wine.domain.SocialListVO;
import org.wine.domain.SocialPageDTO;
import org.wine.domain.SocialReviewVO;
import org.wine.domain.SocialWishVO;
import org.wine.domain.UserVO;
import org.wine.service.SocialService;
import org.wine.service.UserService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping({"/user/*","/seller/*","/wine/*","/board/*","/order/*","/cart/*","/wishList/*","/includes/*"})
@AllArgsConstructor
public class UserController {

	@Autowired
	private UserService service;

	@Autowired
	private JavaMailSender emailSender;
	
	@Autowired
	private SocialService socialservice;

	@GetMapping("/settings")
	public void userSettings(HttpServletRequest request,@RequestParam("userNum") Long userNum ,SocialCriteriaReview crire,UserVO user,Model model) {

		log.info("유저 세팅 페이지");

		log.info("setting");

		model.addAttribute("setting", service.get(userNum));
		
		List<ProfileVO> imageck =  service.imageCk(userNum);
		
		log.info("imageck : " +imageck);
		
		model.addAttribute("imageck",imageck);  //이미지 체크 유무
		 
	}
	
	@PostMapping({ "/settings" })
	public String settingRegister(HttpServletRequest request,@RequestParam("path") String path, @RequestParam("query") String query, UserVO user,RedirectAttributes rttr) {
		
		if(user.getProfileList() !=null) {
			
			user.getProfileList().forEach(attach ->log.info(attach));
		}
		if(query==""||query==null) {
			
		}else {
			query = "?" + query;
		}
		
		log.info("path :"+path);
		
		log.info("query :"+query);
		
		service.register(user);
		
		rttr.addFlashAttribute("resultimage",user.getUserNum());
		
		HttpSession session = request.getSession();
		
		Long loginNum = (Long)session.getAttribute("loginNum");
		
		List<ProfileVO> headerck =  service.imageCk(loginNum);
		
		log.info("headerck : " +headerck);
		
		session.setAttribute("headerck",headerck);  //이미지 체크 유무
		
		return  "redirect:"+ path+query;
	}
	
	@GetMapping({ "/userpage" })
	public void get(HttpServletRequest request,@RequestParam("userNum") Long userNum ,SocialCriteriaReview crire,UserVO user,Model model) {

	    HttpSession session = request.getSession();

	    Long loginNum = (Long)session.getAttribute("loginNum");
		
	    log.info("loginNum : "+ loginNum);
	    
		log.info("userpage");

		model.addAttribute("userpage", service.get(userNum));
		
		model.addAttribute("followck", socialservice.followingBtn(userNum,loginNum)); //팔로잉 버튼 체크 유무
		
		List<SocialListVO> followinglist = socialservice.followingList(userNum);
	
		model.addAttribute("followinglist",followinglist );  //팔로잉 리스트
		
		List<SocialListVO> followerlist = socialservice.followerList(userNum);
		
		model.addAttribute("followerlist",followerlist );  //팔로워 리스트
		
		List<SocialReviewVO> socialreviewlist = socialservice.followingReviewList(crire, userNum);
		
		log.info("socialreviewlist : " + socialreviewlist);
		
		model.addAttribute("socialreviewlist",socialreviewlist );  //소셜리뷰 리스트
		
		List<ProfileVO> imageck =  service.imageCk(userNum);
		
		log.info("imageck : " +imageck);
		
		model.addAttribute("imageck",imageck);  //이미지 체크 유무
		
		int followercnt = socialservice.getCountByFollower(userNum);
		
		model.addAttribute("followercnt",followercnt);
		
		int followingcnt = socialservice.getCountByFollowing(userNum);
		
		model.addAttribute("followingcnt",followingcnt);
		
		List<SocialWishVO> list = service.getwishList(userNum);

		log.info("wishList : " + list);
		
		model.addAttribute("wish",service.getwishList(userNum)); //해당 유저 위시리스트
		
		model.addAttribute("Socialreviewpaging",socialservice.followingReviewListPaging(crire,userNum));
		
		int total = socialservice.getCountByuserNum(userNum);
		
		log.info("total:" + total); 
		
		model.addAttribute("pageReviewMaker",new SocialPageDTO(crire,total)); 
		
		model.addAttribute("myRatingCnt",socialservice.getCountByUserNumRating(userNum)); //자기 자신 레이팅 개수
		
		model.addAttribute("getWishListCnt",service.getwishListCnt(userNum)); //wishList 카운팅
		
	}
	
	@PostMapping({ "/userpage" })
	public String register(@RequestParam("path") String path, @RequestParam("query") String query, UserVO user,RedirectAttributes rttr) {
		
		if(user.getProfileList() !=null) {
			
			user.getProfileList().forEach(attach ->log.info(attach));
		}
		if(query==""||query==null) {
			
		}else {
			query = "?" + query;
		}
		
		log.info("path :"+path);
		
		log.info("query :"+query);
		
		service.register(user);
		
		rttr.addFlashAttribute("resultimage",user.getUserNum());
		
		return  "redirect:"+ path+query;
	}
	
	@GetMapping("/login")
	public void login() {
		log.info("login");

	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String loginPOST(@RequestParam(value="path" ,required=false) String path, @RequestParam(value="query",required=false) String query,HttpServletRequest request, UserVO user, RedirectAttributes rttr) {

		HttpSession session = request.getSession();
		UserVO lvo = service.userLogin(user);
		
		if(query==""||query==null) {
			
		}else {
			query = "?" + query;
		}
		
		log.info("path :"+path);
		
		log.info("query :"+query);
		
		if (lvo == null) { // 일치하지 않는 아이디, 비밀번호 입력 경우

			int result = 0;
			rttr.addFlashAttribute("result", result);
			log.info(result);
			return  "redirect:"+ path+query;

		}
		
		int result = 1;
		
		rttr.addFlashAttribute("result", result);
		
		log.info(result);
		
		session.setAttribute("user", lvo);

		Long loginNum=lvo.getUserNum();
		
		List<ProfileVO> headerck =  service.imageCk(loginNum);
		
		log.info("headerck : " +headerck);
		
		session.setAttribute("headerck",headerck);  //이미지 체크 유무
		
		session.setAttribute("loginNum", loginNum);
		
		return  "redirect:"+ path+query;
	}
	
	
	
	@RequestMapping(value = "/emailModify", method = RequestMethod.POST)
	public String modifyEmail(@RequestParam(value="path" ,required=false) String path, @RequestParam(value="query",required=false) String query,
			UserVO user, RedirectAttributes rttr) {

		log.info(user);
		
		int email = service.modifyEmail(user);
		
		if(query==""||query==null) {
			
		}else {
			query = "?" + query;
		}
		
		log.info("path :"+path);
		
		log.info("query :"+query);
		
		if (email == 0) { // 일치하지 않는 아이디, 비밀번호 입력 경우
			int resultEmail = 0;
			
			rttr.addFlashAttribute("resultEmail", resultEmail);
			
			log.info(resultEmail);
			
			return "redirect:"+ path+query;
		}
	
		return  "redirect:"+ path+query;
	}
	
	@RequestMapping(value = "/nickNameModify", method = RequestMethod.POST)
	public String modifyNickName(@RequestParam(value="path" ,required=false) String path, @RequestParam(value="query",required=false) String query,
			UserVO user, RedirectAttributes rttr) {

		log.info(user);
		
		int nickName = service.modifyNickName(user);
		
		if(query==""||query==null) {
			
		}else {
			query = "?" + query;
		}
		
		log.info("path :"+path);
		
		log.info("query :"+query);
		
		if (nickName == 0) { // 일치하지 않는 아이디, 비밀번호 입력 경우
			
			int resultNickName = 0;
			
			rttr.addFlashAttribute("resultNickName", resultNickName);
			
			log.info("resultNickName : "+resultNickName);
			
			return "redirect:"+ path+query;
		}
	
		return  "redirect:"+ path+query;
	}
	
	@RequestMapping(value = "/passwordModify", method = RequestMethod.POST)
	public String modifyPassword(@RequestParam(value="path" ,required=false) String path, @RequestParam(value="query",required=false) String query,
			UserVO user, RedirectAttributes rttr) {

		log.info(user);
		
		int password = service.modifyPassword(user);
		
		if(query==""||query==null) {
			
		}else {
			query = "?" + query;
		}
		
		log.info("path :"+path);
		
		log.info("query :"+query);
		
		if (password == 0) { // 일치하지 않는 아이디, 비밀번호 입력 경우
			int resultPassword = 0;
			rttr.addFlashAttribute("resultPassword", resultPassword);
			log.info(resultPassword);
			return "redirect:"+ path+query;
		}
	
		return  "redirect:"+ path+query;
	}
	
	@RequestMapping(value = "/userInfoModify", method = RequestMethod.POST)
	public String userInfoPassword(@RequestParam(value="path" ,required=false) String path, @RequestParam(value="query",required=false) String query, UserVO user, RedirectAttributes rttr) {

		log.info(user);
		
		int userInfo = service.modifyUserInfo(user);
		
		if(query==""||query==null) {
			
		}else {
			query = "?" + query;
		}
		
		log.info("path :"+path);
		
		log.info("query :"+query);
		
		if (userInfo == 0) { // 일치하지 않는 아이디, 비밀번호 입력 경우
			int resultuserInfo = 0;
			
			rttr.addFlashAttribute("resultuserInfo", resultuserInfo);
			
			log.info(resultuserInfo);
			
			return "redirect:"+ path+query;
		}
	
		return  "redirect:"+ path+query;
	}
	
	  @RequestMapping(value="/logout", method=RequestMethod.GET)
	    public String logoutMainGET(HttpServletRequest request) throws Exception{
	       
	        HttpSession session = request.getSession();
			
	        session.invalidate();
	         
	        return  "redirect:/wine/main";
	       
	    }

	@GetMapping("/join")
	public void join() {
		log.info("join");

	}

	@PostMapping("/join")
	public String join(@RequestParam("path") String path, @RequestParam("query") String query,UserVO user, RedirectAttributes rttr) {
		log.info("join : " + user);
  
		if(query==""||query==null) {
			
		}else {
			query = "?" + query;
		}
		
		service.join(user);

		rttr.addFlashAttribute("result", user.getUserNum());
		
		return  "redirect:"+ path + query;
	}

	@ResponseBody
	@PostMapping("/userIdchk")
	public String userIdchk(String userId) {

		log.info("userIdchk " + userId);

		int result = service.idCheck(userId);

		log.info("결과값 = " + result);

		if (result != 0) {

			return "fail";

		} else {

			return "success";

		}
	}

	@ResponseBody
	@PostMapping("/userNickNamechk")
	public String userNickNamechk(String userNickName) {

		log.info("userNickNamechk " + userNickName);

		int result = service.nicknameCheck(userNickName);

		log.info("결과값 = " + result);

		if (result != 0) {

			return "fail";

		} else {

			return "success";

		}
	}

	@GetMapping("/emailcheck")
	@ResponseBody
	public String mailecheck(String email) {
		log.info("이메일 데이터 전송 확인");
		log.info("인증번호 : " + email);

		Random random = new Random();
		int checkNum = random.nextInt(888888) + 111111;
		log.info("인증번호 : " + checkNum);

		String setFrom = "choiyeosep@naver.com";
		String toMail = email;
		String title = "회원가입 인증 이메일 입니다.";
		String content = "홈페이지를 방문해주셔서 감사합니다." + "<br><br>" + "인증 번호는 " + checkNum + "입니다." + "<br>"
				+ "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";

		try {

			MimeMessage message = emailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			helper.setText(content, true);
			emailSender.send(message);

		} catch (Exception e) {
			e.printStackTrace();
		}

		String num = Integer.toString(checkNum);
		return num;
	}

	
	@GetMapping(value ="/getAttachList",produces =MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResponseEntity<List<ProfileVO>> getAttach(Long userNum){
		log.info("getAttachList "+userNum);
		
		List<ProfileVO> list = service.getAttachList(userNum);
		
		return new ResponseEntity<>(service.getAttachList(userNum),HttpStatus.OK);
	}
	
	
	
   @PostMapping("/imageremove")
   public String remove( HttpServletRequest request,@RequestParam("path") String path, @RequestParam("query") String query,@RequestParam("userNum") Long userNum, RedirectAttributes rttr) {
      log.info("remove......."+userNum);

      if(query==""||query==null) {
		
      }else {
    	  query = "?" + query;
		}
	
		log.info("path remove :"+path);
		
		log.info("query  remove:"+query);
		
		service.remove(userNum);
		
		Object session = request.getAttribute("headerck");
		
		log.info("session "+ session);
		
		HttpSession session2 = request.getSession();
		
		Long loginNum = (Long)session2.getAttribute("loginNum");
		
		List<ProfileVO> headerck =  service.imageCk(loginNum);
		
		log.info("headerck : " +headerck);
		
		session2.setAttribute("headerck",headerck);  //이미지 체크 유무
		
		rttr.addFlashAttribute("result", 0 );
		
		return  "redirect:"+ path + query;
      
   }
   
	
	  @PostMapping({ "/header" }) public String getProfile(@RequestParam("path")
	  String path, @RequestParam("query") String query, UserVO
	  user,RedirectAttributes rttr) {
	  
	  if(user.getProfileList() !=null) {
	  
	  user.getProfileList().forEach(attach ->log.info(attach)); }
	  if(query==""||query==null) {
	  
	  }else { query = "?" + query; }
	  
	  log.info("path :"+path);
	  
	  log.info("query :"+query);
	  
	  service.register(user);
	  
	  rttr.addFlashAttribute("resultimage",user.getUserNum());
	  
	  return "redirect:"+ path+query; 
	  
	 }
	 

	
	 
}
