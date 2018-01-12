package member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import member.service.MemberService;
import member.vo.MemberVO;

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
		
		return "redirect:/board.do?index=0&order=hits&time=3";
	}
}
