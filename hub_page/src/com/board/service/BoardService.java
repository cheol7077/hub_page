package com.board.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.board.dao.BoardDAO;
import com.board.vo.BoardVO;

@Service
public class BoardService {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<BoardVO> getBoardList(int index, String order, int time, String site) {
		BoardDAO boardDao = sqlSessionTemplate.getMapper(BoardDAO.class);
		return boardDao.getBoardList(index, order, time, site);
	}
	
	public List<BoardVO> getBoardSearch(int index, String order, int time, String searchKeyword, String searchOption){
		BoardDAO boardDao = sqlSessionTemplate.getMapper(BoardDAO.class);
		return boardDao.getBoardSearch(index, order, time, searchKeyword, searchOption);
	}
}
