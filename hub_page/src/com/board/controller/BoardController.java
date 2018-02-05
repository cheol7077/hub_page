package com.board.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.board.service.BoardService;
import com.board.vo.BoardVO;
import com.board.vo.Conversion;
import com.board.vo.OverlabConversion;
import com.board.vo.TIME_MAXIMUM;

@Controller
public class BoardController {
	final int INIT = 0;
	Conversion c = new Conversion();
	OverlabConversion o = new OverlabConversion();
	@Autowired
	BoardService boardService;

	@RequestMapping("/main.do")
	public void main() {
	}

	@RequestMapping("/board.do")
	public void board(@RequestParam("index") int index, @RequestParam("order") String order,
			@RequestParam("time") int time,@RequestParam("searchKeyword") String searchKeyword,
			@RequestParam("searchOption") String searchOption, @RequestParam(value = "siteList[]") List<String> siteList, @RequestParam("adultView") String adultView, Model model) throws ParseException {
		List<BoardVO> boardList = boardService.getBoardList(index, order, time,searchKeyword,searchOption, siteList, adultView);
		boardList = c.conversion(boardList);
		model.addAttribute("boardList", boardList);
	}
	
	@RequestMapping("/overlab.do")
	public void overlabControl(@RequestParam("overlab") String overlab, Model model) throws Exception {
		ArrayList<String> overlabList = o.getOverlab(overlab);
		
		model.addAttribute("overlabList", overlabList);
	}

}
