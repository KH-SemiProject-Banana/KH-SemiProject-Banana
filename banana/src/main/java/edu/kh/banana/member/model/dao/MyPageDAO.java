package edu.kh.banana.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.banana.member.model.vo.Member;

@Repository
public class MyPageDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int changeIntroduce(Member member) {
		
		return sqlSession.update("myPageMapper.changeIntroduce",member);
	}

	/** 내정보 수정
	 * @param inputMember
	 * @return
	 */
	public int updateInfo(Member inputMember) {
		return sqlSession.update("myPageMapper.updateInfo",inputMember);
	}



	

}
