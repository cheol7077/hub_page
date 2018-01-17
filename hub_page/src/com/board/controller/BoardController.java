package com.board.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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

	@RequestMapping("/board.do")
	public String board(@RequestParam("index") int index, @RequestParam("order") String order, @RequestParam("time") int time, @RequestParam("site") String site,
			HttpServletRequest request) {
		System.out.println("index = " + index + " order = " + order + " time = " +time + " site = " +site);
		List<BoardVO> list = boardService.getBoardList(index, order, time,site);
		
		list = c.conversion(list);
		
		request.setAttribute("list", list);
	    
		if (index == INIT)
			return "board";
		else
			return "boardAdd";
	}

	@RequestMapping("/boardSearch.do")
	public String boardSearch(@RequestParam("index") int index, @RequestParam("order") String order, @RequestParam("time") int time,
			@RequestParam("searchKeyword") String searchKeyword,@RequestParam("searchOption") String searchOption, HttpServletRequest request) {
		List<BoardVO> list = boardService.getBoardSearch(index, order, time, searchKeyword, searchOption);
		
		list = c.conversion(list);
		
		request.setAttribute("list", list);
	    
		if (index == INIT)
			return "board";
		else
			return "boardAdd";
	}
}
