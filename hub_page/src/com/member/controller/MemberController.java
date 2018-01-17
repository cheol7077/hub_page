package com.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.member.service.MemberService;
import com.member.vo.MemberVO;

@Controller
public class MemberController {
	@Autowired
	MemberService memberService;

	@RequestMapping("/signupUI.do")
	public String signupUI() {
		return "signupUI";
	}

	@RequestMapping("/signup.do")
	public String signup(MemberVO mv) {
		memberService.insertMember(mv);

		return "main";
	}

	@RequestMapping("/memberCheck.do")
	public void check(@RequestParam("userID") String userID, HttpServletRequest request) {
		MemberVO mv = memberService.getMember(userID);
		request.setAttribute("member", mv);
	}

	@RequestMapping("/login.do")
	public String login(@RequestParam("userID") String userID, @RequestParam("password") String password,
			HttpSession session) {
		int check = memberService.checkMember(userID, password);
		if (check != 0)
			session.setAttribute("sessionId", userID);
		
		return "main";
	}
	
	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "main";
	}
}
