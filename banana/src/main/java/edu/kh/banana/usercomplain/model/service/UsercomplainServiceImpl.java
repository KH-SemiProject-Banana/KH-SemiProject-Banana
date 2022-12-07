package edu.kh.banana.usercomplain.model.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.banana.usercomplain.model.dao.UserComplainDAO;

@Service
public class UsercomplainServiceImpl implements UserComplainService {
	
	@Autowired
	private UserComplainDAO dao;

	@Override
	public int userReportSubmit(Map<String, Object> submit) {
		
		return dao.userReportSubmit(submit);
	}

	@Override
	public int userDuplication(Map<String, Object> map) {
		
		return dao.userDuplication(map);
	}

	@Override
	public int userBlock(int memberNo, int userBlocked) {
	
		return dao.userBlock(memberNo, userBlocked);
	}

}
