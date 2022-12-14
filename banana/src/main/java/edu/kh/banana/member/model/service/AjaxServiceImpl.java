package edu.kh.banana.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import edu.kh.banana.member.model.dao.AjaxDAO;

@Service 
public class AjaxServiceImpl implements AjaxService {

	@Autowired
	private AjaxDAO dao;

	// 이메일 중복 검사
	@Override
	public int emailDupCheck(String memberEmail) {
		return dao.emailDupcheck(memberEmail);
	}

	// 닉네임 중복 검사
	@Override
	public int nicknameDupCheck(String memberNickname) {
		return dao.nicknameDupCheck(memberNickname);
	}

	// 전화번호 중복 검사
	@Override
	public int telDupCheck(String memberTel) {
		return dao.telDupCheck(memberTel);
	}
	
}