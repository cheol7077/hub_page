package com.board.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.board.vo.BoardVO;

public interface BoardDAO {
	public List<BoardVO> getBoardList(@Param("index") int index, @Param("order") String order, @Param("time") int time,
			@Param("searchKeyword") String keyword, @Param("searchOption") String searchOption,
			@Param("siteList") List<String> siteList, @Param("adultView") String adultView );
	
}
