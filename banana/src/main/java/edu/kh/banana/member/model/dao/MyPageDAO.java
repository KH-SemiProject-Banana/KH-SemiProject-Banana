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

	/** 내 회원 정보 수정
	 * @param inputMember
	 * @return
	 */
	public int updateInfo(Member inputMember) {
		return sqlSession.update("myPageMapper.updateInfo",inputMember);
	}

	
	/** 판매완료한 내 게시글의 수 조회
	 * @param memberNo
	 * @return
	 */
	public int getListCount(int memberNo) {
		
		return sqlSession.selectOne("myPageMapper.getListCount", memberNo);
	}



	

}
