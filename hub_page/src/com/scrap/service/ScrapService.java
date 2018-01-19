package com.scrap.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.board.vo.BoardVO;
import com.scrap.dao.ScrapDAO;

@Service
public class ScrapService {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public int scrapBoard(@Param("uid") int uid, @Param("bid") int bid) {
		ScrapDAO scrapDao = sqlSessionTemplate.getMapper(ScrapDAO.class);
		return scrapDao.scrapBoard(uid, bid);
	}
	
	public int checkScrap(@Param("uid") int uid, @Param("bid") int bid) {
		ScrapDAO scrapDao = sqlSessionTemplate.getMapper(ScrapDAO.class);
		return scrapDao.checkScrap(uid, bid);
	}
	
	public List<BoardVO> getBoardList(@Param("uid") int uid) {
		ScrapDAO scrapDao = sqlSessionTemplate.getMapper(ScrapDAO.class);
		return scrapDao.getBoardList(uid);
	}
	
	public int deleteScrap(@Param("uid") int uid, @Param("bid") int bid) {
		ScrapDAO scrapDao = sqlSessionTemplate.getMapper(ScrapDAO.class);
		return scrapDao.deleteScrap(uid, bid);
	}
}
