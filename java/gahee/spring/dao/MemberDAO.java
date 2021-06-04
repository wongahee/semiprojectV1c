package gahee.spring.dao;

import gahee.spring.vo.Member;

public interface MemberDAO {
	
	int insertMember(Member m);
	int selectLogin(Member m);
	Member selectOneMember(String mno);

}