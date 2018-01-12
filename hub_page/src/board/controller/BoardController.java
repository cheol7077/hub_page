package board.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import board.service.BoardService;
import board.vo.BoardVO;

@Controller
public class BoardController {
	@Autowired
	BoardService boardService;

	@RequestMapping("/board.do")
	public String board(@RequestParam("index") int index, @RequestParam("order") String order, @RequestParam("time") int time,
			HttpServletRequest request) {
		List<BoardVO> list = boardService.getBoardList(index, order, time);
		request.setAttribute("list", list);
	    
		if (index == 0)
			return "board";
		else
			return "boardAdd";
	}
	
	@RequestMapping("/boardSearch.do")
	public String boardSearch(@RequestParam("index") int index, @RequestParam("order") String order, @RequestParam("time") int time,
			@RequestParam("searchKeyword") String searchKeyword,@RequestParam("searchOption") String searchOption, HttpServletRequest request) {
	    System.out.println("서치키워드 : " + searchKeyword + "서치 옵션 : " + searchOption);
		List<BoardVO> list = boardService.getBoardSearch(index, order, time, searchKeyword, searchOption);
		request.setAttribute("list", "");
		request.setAttribute("list", list);
		if (index == 0)
			return "board";
		else
			return "boardAdd";
	}
	
	
}
