package edu.kh.banana.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import edu.kh.banana.member.model.dao.MemberDAO;

@Service
public class MemberServiceImpl  implements MemberService{

	@Autowired
	private BCryptPasswordEncoder bcrypt;
	
	@Autowired
	private MemberDAO dao;
	
	
}
