package edu.kh.banana.manager.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import edu.kh.banana.board.model.vo.Board;
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
	 * 고객센터-자주묻는 질문 추가
	 */
	@Override
	public int editBoard1(Board board) {
		
		return dao.editBoard1(board);
	}

}
