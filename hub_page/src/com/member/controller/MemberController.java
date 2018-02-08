package com.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.member.service.MemberService;
import com.member.vo.MemberVO;

@Controller
public class MemberController {
	final String R_MAIN = "redirect:/main.do";
	final String F_MAIN = "forward:/main.do";
	final int SUCCESS = 1;
	final int FAIL = 0;
	@Autowired
	MemberService memberService;

	@RequestMapping("/signupUI.do")
	public void signupUI() {
	}

	@RequestMapping("/signup.do")
	public String signup(MemberVO mv) {
		memberService.insertMember(mv);

		return R_MAIN;
	}

	@RequestMapping("/memberCheck.do")
	@ResponseBody
	public String memberCheck(@RequestParam("userID") String userID, Model model) {
		String check = "";
		MemberVO mv = memberService.getMember(userID);
		if(mv != null)
			check = "FAIL";
		return check;
	}

	@RequestMapping("/login.do")
	public String login(@RequestParam("userID") String userID, @RequestParam("password") String password,
			HttpSession session, Model model) {
		int check = memberService.checkMember(userID, password);
		if (check != 0) {
			session.setAttribute("sessionId", userID);
			model.addAttribute("checkLogin", SUCCESS);
		} else {
			model.addAttribute("checkLogin", FAIL);
		}

		return R_MAIN;
	}

	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return R_MAIN;
	}
}
