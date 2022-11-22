package edu.kh.banana.manager.model.dao;

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

}
