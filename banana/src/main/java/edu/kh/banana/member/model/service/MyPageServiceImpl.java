package edu.kh.banana.member.model.service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.banana.member.model.dao.MyPageDAO;
import edu.kh.banana.member.model.vo.Member;

@Service
public class MyPageServiceImpl implements MyPageService{
	
	@Autowired
	private MyPageDAO dao;

	@Override
	public int changeIntroduce(Member member) {
		
		return dao.changeIntroduce(member);
	}

	

}
