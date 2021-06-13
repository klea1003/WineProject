package org.wine.controller;

import java.util.Random;

import javax.mail.internet.MimeMessage;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.mail.javamail.JavaMailSender;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.wine.domain.UserVO;
import org.wine.service.UserService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/user/*")
@AllArgsConstructor
public class UserController {

	@Autowired
	private UserService service;

	@Autowired
	private JavaMailSender emailSender;

	
	@GetMapping("/main")
	public void mainPageGET() {

		log.info("메인 테스트 페이지");

	}

	@GetMapping("/login")
	public void login() {
		log.info("login");

	}

	@GetMapping("/join")
	public void join() {
		log.info("join");

	}

	@PostMapping("/join")
	public String join(UserVO user, RedirectAttributes rttr) {
		log.info("join : " + user);

		service.join(user);

		rttr.addFlashAttribute("result", user.getUserNum());

		return "redirect:/user/login";
	}

	@PostMapping("/userIdchk")
	@ResponseBody
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
	@PostMapping("/userNickNamechk")
	@ResponseBody
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
	    String content = 
	                "홈페이지를 방문해주셔서 감사합니다." +
	                "<br><br>" + 
	                "인증 번호는 " + checkNum + "입니다." + 
	                "<br>" + 
	                "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";

//		try {
//
//			MimeMessage message = emailSender.createMimeMessage();
//			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
//			helper.setFrom(setFrom);
//			helper.setTo(toMail);
//			helper.setSubject(title);
//			helper.setText(content, true);
//			emailSender.send(message);
//
//		} catch (Exception e) {
//			e.printStackTrace();
//		}

		String num = Integer.toString(checkNum);
		return num;
	}

}
