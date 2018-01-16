package com.board.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.board.service.BoardService;
import com.board.vo.BoardVO;

@Controller
public class BoardController {
	final int INIT = 0;
	
	@Autowired
	BoardService boardService;

	@RequestMapping("/board.do")
	public String board(@RequestParam("index") int index, @RequestParam("order") String order, @RequestParam("time") int time,
			HttpServletRequest request) {
		List<BoardVO> list = boardService.getBoardList(index, order, time);
		String temp="";
		
		for(int i=0; i<list.size(); i++) {
			temp = list.get(i).getContent();
			temp = temp.replace("\\", "::");
			String contents[] = temp.split("::");
			temp = "";
			
			for(int j=0; j<contents.length; j++) {
			contents[j] = contents[j].replace("::","");
			if(contents[j].startsWith("http")&&((contents[j].endsWith("jpg")||(contents[j].endsWith("bmp"))||(contents[j].endsWith("gif"))||(contents[j].endsWith("png"))||(contents[j].endsWith("jpeg"))
					||(contents[j].endsWith("JPG"))||(contents[j].endsWith("JPEG"))||(contents[j].endsWith("BMP"))||(contents[j].endsWith("GIF"))||(contents[j].endsWith("PNG")) ))){
				contents[j] = "<img width = 200 height = 200 src =\'" +contents[j] + "\'/>" + "";
			}else if(contents[j].startsWith("https://www.youtube.com")||(contents[j].startsWith("https://media"))){
				contents[j] = "<iframe src =\'" +contents[j] + "\'></iframe>"  ;
			}else if(contents[j].startsWith("http")){
				contents[j] = "<a href =\'" +contents[j] + "\'></a>" ;						
			}
			temp += contents[j];
			}
			
			list.get(i).setContent(temp);
		}
		
		request.setAttribute("list", "");
		request.setAttribute("list", list);
	    
		if (index == 0)
			return "board";
		else
			return "boardAdd";
	}
	
	@RequestMapping("/boardSearch.do")
	public String boardSearch(@RequestParam("index") int index, @RequestParam("order") String order, @RequestParam("time") int time,
			@RequestParam("searchKeyword") String searchKeyword,@RequestParam("searchOption") String searchOption, HttpServletRequest request) {
		List<BoardVO> list = boardService.getBoardSearch(index, order, time, searchKeyword, searchOption);
		String temp="";
		
		for(int i=0; i<list.size(); i++) {
			temp = list.get(i).getContent();
			temp = temp.replace("\\", "::");
			String contents[] = temp.split("::");
			temp = "";
			
			for(int j=0; j<contents.length; j++) {
			contents[j] = contents[j].replace("::","");
			if(contents[j].startsWith("http")&&((contents[j].endsWith("jpg")||(contents[j].endsWith("bmp"))||(contents[j].endsWith("gif"))||(contents[j].endsWith("png"))||(contents[j].endsWith("jpeg"))
					||(contents[j].endsWith("JPG"))||(contents[j].endsWith("JPEG"))||(contents[j].endsWith("BMP"))||(contents[j].endsWith("GIF"))||(contents[j].endsWith("PNG")) ))){
				contents[j] = "<img width = 200 height = 200 src =\'" +contents[j] + "\'/>" + "";
			}else if(contents[j].startsWith("https://www.youtube.com")||(contents[j].startsWith("https://media"))){
				contents[j] = "<iframe src =\'" +contents[j] + "\'></iframe>"  ;
			}else if(contents[j].startsWith("http")){
				contents[j] = "<a href =\'" +contents[j] + "\'></a>" ;						
			}
			temp += contents[j];
			}
			
			list.get(i).setContent(temp);
		}
		
		request.setAttribute("list", "");
		request.setAttribute("list", list);
	    
		if (index == INIT)
			return "board";
		else
			return "boardAdd";
	}
}