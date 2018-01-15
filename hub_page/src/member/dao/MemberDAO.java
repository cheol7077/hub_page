package member.dao;

import member.vo.MemberVO;

public interface MemberDAO {
	public int insertMember(MemberVO mv);
	public MemberVO checkMember(String userID);
}
