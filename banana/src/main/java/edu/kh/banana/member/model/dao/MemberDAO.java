package edu.kh.banana.member.model.dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.banana.member.model.vo.Member;

@Repository
public class MemberDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	/** 로그인 DAO
	 * @param memberEmail
	 * @return
	 */
	public Member login(String memberEmail) {
		return sqlSession.selectOne("memberMapper.login", memberEmail);
	}

	/** 회원가입 입력 정보 제출 DAO
	 * @param inputMember
	 * @return
	 */
	public int signUp(Member inputMember) {
		return sqlSession.insert("memberMapper.signUp", inputMember);
	}

	/** 회원 ID/PW 찾기 회원조회
	 * @param paramMap
	 * @return 
	 */
	public String infoFindSelect(Map<String, Object> paramMap) {
		return sqlSession.selectOne("memberMapper.infoFindSelect",paramMap);
	}

	/** 임시 비밀번호 생성 및 저장
	 * @param encPw
	 * @param inputEmail 
	 * @return
	 */
	public int findEmailPw(String encPw, String result) {
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("encPw", encPw);
		map.put("result", result);
		
		
		
		return sqlSession.update("memberMapper.findEmailPw",map);
	}

	
	
	
}
