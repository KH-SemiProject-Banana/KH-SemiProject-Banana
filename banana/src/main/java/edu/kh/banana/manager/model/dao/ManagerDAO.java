package edu.kh.banana.manager.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import edu.kh.banana.member.model.vo.Member;

@Repository
public class ManagerDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public Member login(String memberEmail) {
		
		return sqlSession.selectOne("memberMapper.managerLogin", memberEmail);
	}

	/** 회원 목록 조회
	 * @param paramMap
	 * @return memberList
	 */
	public List<Member> memberSearch(Map<String, Object> paramMap) {
		
		return sqlSession.selectList("memberMapper.admin-memberSearch", paramMap);
	}

	/** 전체 회원 수 조회
	 * @return
	 */
	public int memberCount() {
		
		return sqlSession.selectOne("memberMapper.memberCount");
	}

}
