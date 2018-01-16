package com.member.service;

import org.apache.ibatis.annotations.Param;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.member.dao.MemberDAO;
import com.member.vo.MemberVO;

@Service
public class MemberService {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public int insertMember(MemberVO mv) {
		MemberDAO memberDao = sqlSessionTemplate.getMapper(MemberDAO.class);
		return memberDao.insertMember(mv);
	}
	
	public MemberVO getMember(String userID) {
		MemberDAO memberDao = sqlSessionTemplate.getMapper(MemberDAO.class);
		return memberDao.getMember(userID);
	}
	
	public int checkMember(String userID, String password) {
		MemberDAO memberDao = sqlSessionTemplate.getMapper(MemberDAO.class);
		return memberDao.checkMember(userID, password);
	}
	
	public int getId(@Param("userId") String userId) {
		MemberDAO memberDao = sqlSessionTemplate.getMapper(MemberDAO.class);
		return memberDao.getId(userId);
	}
}
