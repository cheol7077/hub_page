package com.scrap.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.board.vo.BoardVO;
import com.member.service.MemberService;
import com.scrap.service.ScrapService;

@Controller
public class ScrapController {
	@Autowired
	MemberService memberService;
	@Autowired
	ScrapService scrapService;

	@RequestMapping("/scrap.do")
	public void scrap(@RequestParam("bid") int bid, HttpSession session, Model model) {
		String userId = (String) session.getAttribute("sessionId");
		int uid = memberService.getId(userId);
		int check = scrapService.checkScrap(uid, bid);
		if (check == 0)
			scrapService.scrapBoard(uid, bid);
		else
			bid = -1;

		model.addAttribute("bid", bid);
	}
	
	@RequestMapping("/scrapBoard.do")
	public void scrapBoard(HttpSession session, HttpServletRequest request) {
		String userId = (String) session.getAttribute("sessionId");
		int uid = memberService.getId(userId);
		List<BoardVO> list = scrapService.getBoardList(uid);
		
		request.setAttribute("list", list);
	}
}
