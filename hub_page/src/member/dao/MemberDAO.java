package member.dao;

import org.apache.ibatis.annotations.Param;

import member.vo.MemberVO;

public interface MemberDAO {
	public int insertMember(MemberVO mv);
	public MemberVO getMember(@Param("userID") String userID);
	public int checkMember(@Param("userID")String userID, @Param("password")String password);
}
