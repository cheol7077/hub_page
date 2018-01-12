package member.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import member.dao.MemberDAO;
import member.vo.MemberVO;

@Service
public class MemberService {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public int insertMember(MemberVO mv) {
		MemberDAO memberDao = sqlSessionTemplate.getMapper(MemberDAO.class);
		return memberDao.insertMember(mv);
	}
}