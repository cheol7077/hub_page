package com.scrap.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.board.vo.BoardVO;
import com.member.service.MemberService;
import com.scrap.service.ScrapService;

@Controller
public class ScrapController {
	final int FAIL = -1;
	
	@Autowired
	MemberService memberService;
	@Autowired
	ScrapService scrapService;

	@RequestMapping("/scrap.do")
	@ResponseBody
	public String scrap(@RequestParam("bid") int bid, HttpSession session, Model model) {
		String userId = (String) session.getAttribute("sessionId");
		int uid = memberService.getId(userId);
		int check = scrapService.checkScrap(uid, bid);
		if (check == 0)
			scrapService.scrapBoard(uid, bid);
		else
			bid = FAIL;

		return Integer.toString(bid);
	}
	
	@RequestMapping("/scrapBoard.do")
	public void scrapBoard(HttpSession session, Model model) {
		String userId = (String) session.getAttribute("sessionId");
		int uid = memberService.getId(userId);
		List<BoardVO> boardList = scrapService.getBoardList(uid);
		
		model.addAttribute("boardList", boardList);
	}
	
	@RequestMapping("/scrapDelete.do")
	public String scrapDelete(@RequestParam("bid") int bid, HttpSession session) {
		String userId = (String) session.getAttribute("sessionId");
		int uid = memberService.getId(userId);
		scrapService.deleteScrap(uid, bid);
		
		return "redirect:/scrapBoard.do";
	}
}
