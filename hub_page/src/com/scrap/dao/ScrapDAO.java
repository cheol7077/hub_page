package com.scrap.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.board.vo.BoardVO;

public interface ScrapDAO {
	public int scrapBoard(@Param("uid") int uid, @Param("bid") int bid);
	public int checkScrap(@Param("uid") int uid, @Param("bid") int bid);
	public List<BoardVO> getBoardList(@Param("uid") int uid);
}
