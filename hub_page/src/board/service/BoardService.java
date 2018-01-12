package board.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import board.dao.BoardDAO;
import board.vo.BoardVO;

@Service
public class BoardService {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<BoardVO> getBoardList(int index, String order, int time) {
		BoardDAO boardDao = sqlSessionTemplate.getMapper(BoardDAO.class);
		return boardDao.getBoardList(index, order, time);
	}
	
	public List<BoardVO> getBoardSearch(int index, String order, int time, String searchKeyword, String searchOption){
		BoardDAO boardDao = sqlSessionTemplate.getMapper(BoardDAO.class);
		System.out.println("인덱스 : " + index + "order : " + order + "타임 : " + time + "서치키워드 : " + searchKeyword + "서치 옵션 : " + searchOption);
		return boardDao.getBoardSearch(index, order, time, searchKeyword, searchOption);
	}
}
