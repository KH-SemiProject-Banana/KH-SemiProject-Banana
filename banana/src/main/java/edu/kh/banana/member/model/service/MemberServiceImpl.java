package edu.kh.banana.member.model.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.kh.banana.member.model.dao.MemberDAO;
import edu.kh.banana.member.model.vo.Member;

@Service
public class MemberServiceImpl  implements MemberService{

	@Autowired
	private BCryptPasswordEncoder bcrypt;
	
	@Autowired
	private MemberDAO dao;

	/**
	 * 로그인 서비스
	 */
	@Override
	public Member login(Member inputMember) {
		
		Member loginMember = dao.login(inputMember.getMemberEmail());
		
		if(loginMember != null) {
			if(bcrypt.matches(inputMember.getMemberPw(), loginMember.getMemberPw())) {
				loginMember.setMemberPw(null);
			} else {
				loginMember = null;
			}
		}
		
		return loginMember;
	}

	/**
	 * 회원가입 입력 정보 제출 서비스
	 */
	@Override
	@Transactional(rollbackFor = Exception.class)
	public int signUp(Member inputMember) {
		
		// 비밀번호 암호화
		String encPw = bcrypt.encode(inputMember.getMemberPw());
		inputMember.setMemberPw(encPw);
		
		int result = dao.signUp(inputMember);
		
		return result;
	}

	/**
	 * 회원 ID/PW 찾기 회원조회
	 */
	@Override
	public String infoFindSelect(Map<String, Object> paramMap) {
		return dao.infoFindSelect(paramMap);
	}

	/**
	 * 임시 비밀번호 생성 및 저장
	 */
	@Override
	public int findEmailPw(String authKey,String result) {
		
		String encPw = bcrypt.encode(authKey);
		
		return dao.findEmailPw(encPw,result);
	}

	
	
	
	
	
}
