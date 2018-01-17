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

@Controller
public class BoardController {
	final int INIT = 0;

	@Autowired
	BoardService boardService;

	@RequestMapping("/main.do")
	public void main() {
	}

	@RequestMapping("/board.do")
	public String board(@RequestParam("index") int index, @RequestParam("order") String order,
			@RequestParam("time") int time, @RequestParam(value = "siteList[]") List<String> siteList, Model model) {
		List<BoardVO> boardList = boardService.getBoardList(index, order, time, siteList);
		model.addAttribute("boardList", boardList);
		return "boardAdd";
	}

	@RequestMapping("/boardSearch.do")
	public String boardSearch(@RequestParam("index") int index, @RequestParam("order") String order,
			@RequestParam("time") int time, @RequestParam("searchKeyword") String searchKeyword,
			@RequestParam("searchOption") String searchOption, Model model) {
		List<BoardVO> boardList = boardService.getBoardSearch(index, order, time, searchKeyword, searchOption);
		
		model.addAttribute("boardList", boardList);

		return "boardAdd";
	}
}