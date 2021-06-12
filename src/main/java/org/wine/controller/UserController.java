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

	// ���� ������ �̵�
	@GetMapping("/main")
	public void mainPageGET() {

		log.info("���� ������ ����");

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

		log.info("����� = " + result);

		if (result != 0) {

			return "fail";

		} else {

			return "success";

		}
	}

	@GetMapping("/emailcheck")
	@ResponseBody
	public String mailecheck(String email) {
		log.info("�̸��� ������ ���� Ȯ��");
		log.info("��������: " + email);

		Random random = new Random();
		int checkNum = random.nextInt(888888) + 111111;
		log.info("������ȣ: " + checkNum);

		String setFrom = "choiyeosep@naver.com";
		String toMail = email;
		String title = "ȸ������ ���� �̸��� �Դϴ�.";
		String content = "Ȩ�������� �湮���ּż� �����մϴ�." + "<br><br>" + "���� ��ȣ�� " + checkNum + "�Դϴ�." + "<br>"
				+ "�ش� ������ȣ�� ������ȣ Ȯ�ζ��� �����Ͽ� �ּ���.";

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
