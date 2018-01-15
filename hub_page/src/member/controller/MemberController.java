package member.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
	
	@RequestMapping("/check.do")
	public String check(@RequestParam("userID") String userID, HttpServletRequest request) {
		MemberVO mv = memberService.checkMember(userID);
		
		request.setAttribute("member", mv);
		
		return "memberCheck";
	}
}
