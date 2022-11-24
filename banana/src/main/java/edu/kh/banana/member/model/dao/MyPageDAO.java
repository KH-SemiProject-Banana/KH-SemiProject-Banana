package edu.kh.banana.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.banana.member.model.vo.Member;

@Repository
public class MyPageDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	
	
	/** 마이페이지 자기소개 수정 
	 * @param member
	 * @return
	 */
	public int changeIntroduce(Member member) {
		return sqlSession.update("myPageMapper.changeIntroduce",member);
	}

	/** 내 회원 정보 수정 (비밀번호 포함)
	 * @param inputMember
	 * @return
	 */
	public int updateInfoPw(Member inputMember) {
		return sqlSession.update("myPageMapper.updateInfoPw",inputMember);
	}

	/** 내 회원 정보 수정 (비밀번호 제외)
	 * @param inputMember
	 * @return
	 */
	public int updateInfoNoPw(Member inputMember) {
		return sqlSession.update("myPageMapper.updateInfoNoPw",inputMember);
	}



	

}
