package com.board.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.board.service.BoardService;
import com.board.vo.BoardVO;
import com.board.vo.Conversion;

@Controller
public class BoardController {
	final int INIT = 0;
	Conversion c = new Conversion();
	@Autowired
	BoardService boardService;

	@RequestMapping("/main.do")
	public void main() {
		
	}

	@RequestMapping("/board.do")
	public void board(@RequestParam("index") int index, @RequestParam("order") String order,
			@RequestParam("time") int time, @RequestParam(value = "siteList[]") List<String> siteList, Model model) {
		List<BoardVO> boardList = boardService.getBoardList(index, order, time, siteList);
		boardList = c.conversion(boardList);
		model.addAttribute("boardList", boardList);
	}

	@RequestMapping("/boardSearch.do")

	public String boardSearch(@RequestParam("index") int index, @RequestParam("order") String order,
			@RequestParam("time") int time, @RequestParam("searchKeyword") String searchKeyword,
			@RequestParam("searchOption") String searchOption, Model model) {
		List<BoardVO> boardList = boardService.getBoardSearch(index, order, time, searchKeyword, searchOption);

		boardList = c.conversion(boardList);
		model.addAttribute("boardList", boardList);

		return "board";
	}
}
