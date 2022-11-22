package edu.kh.banana.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository // DB 연결하는 역할 + bean 등록
public class AjaxDAO {

	@Autowired 
	private SqlSessionTemplate sqlSession;
	
	
	/** 회원가입 이메일 중복 검사
	 * @param memberEmail
	 * @return result
	 */
	public int emailDupcheck(String memberEmail) {
		return sqlSession.selectOne("ajaxMapper.emailDupCheck", memberEmail);
	}


	/** 회원가입 닉네임 중복 검사
	 * @param memberNickname
	 * @return
	 */
	public int nicknameDupCheck(String memberNickname) {
		return sqlSession.selectOne("ajaxMapper.nicknameDupCheck", memberNickname);
	}
	


}