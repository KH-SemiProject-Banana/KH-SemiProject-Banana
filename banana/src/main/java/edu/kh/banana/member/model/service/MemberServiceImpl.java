package edu.kh.banana.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

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
	
	
	
	
	
	
}
