package edu.kh.banana.manager.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import edu.kh.banana.manager.model.dao.ManagerDAO;
import edu.kh.banana.member.model.vo.Member;

@Service
public class ManagerServiceImpl implements ManagerService{
	
	@Autowired
	private ManagerDAO dao;
	
	@Autowired
	private BCryptPasswordEncoder bcrypt;

	@Override
	public Member login(Member inputManager) {
		
		Member loginManager = dao.login(inputManager.getMemberEmail());
		
		
		if(loginManager != null) {
			if(bcrypt.matches(inputManager.getMemberPw(), loginManager.getMemberPw())) {
				loginManager.setMemberPw(null);
			} else {
				loginManager = null;
			}
		}
		return loginManager;
	}

	/**
	 * 회원 목록 조회
	 */
	@Override
	public List<Member> memberSearch(Map<String, Object> paramMap) {
		
		return dao.memberSearch(paramMap);
	}

	/**
	 * 전체 회원 수 조회
	 */
	@Override
	public int memberCount() {
		
		return dao.memberCount();
	}

}
