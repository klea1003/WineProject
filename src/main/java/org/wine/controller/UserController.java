package org.wine.controller;

import java.util.List;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.mail.javamail.JavaMailSender;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.wine.domain.ProfileVO;
import org.wine.domain.SocialVO;
import org.wine.domain.UserVO;
import org.wine.service.SocialService;
import org.wine.service.UserService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping({"/user/*","/seller/*","/wine/*","/board/*"})
@AllArgsConstructor
public class UserController {

	@Autowired
	private UserService service;

	@Autowired
	private JavaMailSender emailSender;
	
	@Autowired
	private SocialService socialservice;

	@GetMapping("/userlist")
	public void userlist(Model model) {

		log.info("유저 리스트페이지");

		model.addAttribute("userlist", service.getList());

	}
	
	@GetMapping({ "/userpage" })
	public void get(@RequestParam("userNum") Long userNum ,UserVO user,Model model) {

		log.info("userpage ");

		model.addAttribute("userpage", service.get(userNum));
		
		model.addAttribute("followck", socialservice.followingBtn(userNum));
		
		List<ProfileVO> imageck =  service.imageCk(userNum);
		
		log.info("imageck : " +imageck);
		
		model.addAttribute("imageck",imageck);
		
		int followercnt = socialservice.getCountByFollower(userNum);
		
		model.addAttribute("followercnt",followercnt);
		
		int followingcnt = socialservice.getCountByFollowing(userNum);
		
		model.addAttribute("followingcnt",followingcnt);
		
		
		model.addAttribute("wish",service.getwishList(userNum));
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
		session.setAttribute("user", lvo);

		return  "redirect:"+ path+query;
	}
	
	  @RequestMapping(value="/logout", method=RequestMethod.GET)
	    public String logoutMainGET( @RequestParam(value="path" ,required=false) String path,@RequestParam(value="query",required=false) String query, HttpServletRequest request) throws Exception{
	        
	        log.info("logoutMainGET메서드 진입");
	        
	        if(query==""||query==null) {
				
			}else {
				query = "?" + query;
			}
			
	        
	        HttpSession session = request.getSession();
			
	        session.invalidate();
	        
	       
	        
	        return  "redirect:/wine/list";
	       
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
		
		List<ProfileVO> list=service.getAttachList(userNum);
		
		return new ResponseEntity<>(service.getAttachList(userNum),HttpStatus.OK);
	}
	
	   @PostMapping("/imageremove")
	   public String remove(@RequestParam("path") String path, @RequestParam("query") String query,@RequestParam("userNum") Long userNum, RedirectAttributes rttr) {
	      log.info("remove......."+userNum);

	 if(query==""||query==null) {
			
		}else {
			query = "?" + query;
		}
		
		log.info("path remove :"+path);
		
		log.info("query  remove:"+query);
		
	     service.remove(userNum);
	    	
	     rttr.addFlashAttribute("result", 0 );

	     return  "redirect:"+ path + query;
	      
	   }

}
